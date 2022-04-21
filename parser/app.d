import std.file : readText;
import std.getopt;
import std.json : JSONValue, parseJSON;
import std.experimental.logger;

void main(string[] args) {
   enum TYP = "TYP";
   enum DYN = "DYN";
   enum STA = "STA";
   bool verbose;
   string input;
   string file = "types";
   string dir = "../src/bindbc/raylib";
   auto opt = getopt(args,
         "input|i", "Json input file", &input,
         "dir|d", "Destination directory", &dir,
         "file|f", "Define file types (TYP for types.d, DYN for binddynamic.d, STA for static", &file,
         "verbose|v", &verbose);
   if (verbose) {
      globalLogLevel(LogLevel.trace);
   } else {
      globalLogLevel(LogLevel.info);
   }

   if (opt.helpWanted || !input.length || !dir.length) {
      defaultGetoptPrinter("raylib parser", opt.options);
   } else {
      JSONValue root = parseJSON(readText(input));
      // create types
      if (file == TYP) {
         dir.createTypes(root);
      } else if (file == DYN) {
         dir.createBinddynamic(root);
      } else if (file == STA) {
         dir.createBindstatic(root);
      } else {
         error("invalid file type");
      }
   }
}

void createTypes(string dir, JSONValue root) {
   import std.stdio : File;
   import std.path : buildPath;

   JSONValue[] structs = root["structs"].array;
   JSONValue[] enums = root["enums"].array;
   auto of = File(buildPath(dir, "types.d"), "w");

   void writeRem(JSONValue j, string space = "") {
      if (j["description"].str.length) {
         of.writefln("%s/// %s", space, j["description"].str);
      }
   }
   string s = import("types.txt");
   of.writeln(s);

   of.writeln();
   of.writeln("// structs");
   of.writeln();
   foreach (e; structs) {
      writeRem(e);
      of.writefln("struct %s {", e["name"].str);
      foreach (f; e["fields"].array) {
         writeRem(f, "   ");
         f = dstyle(f);
         of.writefln("   %s %s;", f["type"].str.convertType, f["name"].str);
      }
      of.writeln("}");
   }
   of.writeln();

   of.writeln("alias RenderTexture2D = RenderTexture;");
   of.writeln("alias Camera = Camera3D;");
   of.writeln("alias Texture2D = Texture;");
   of.writeln("alias TextureCubemap = Texture;");
   of.writeln("alias Quaternion = Vector4;");
   of.writeln("struct rAudioBuffer {}");

   of.writeln();
   of.writeln("// enums");
   of.writeln();

   foreach (e; enums) {
      string en = e["name"].str;
      if (en.skipEnum) {
         continue;
      }

      writeRem(e);
      of.writefln("enum %s {", en);
      foreach (f; e["values"].array) {
         writeRem(f, "   ");
         of.writefln("   %s = %s,", f["name"].str, f["value"].integer);
      }
      of.writeln("}");

      writeRem(e);
      of.writefln("enum {");
      foreach (f; e["values"].array) {
         writeRem(f, "   ");
         of.writefln("   %s = %s.%s,", f["name"].str, en, f["name"].str);
      }
      of.writeln("}");
      of.writeln();

   }
}

JSONValue dstyle(JSONValue j) {
   import std.regex;
   auto ctr = ctRegex!(`^(\w+)(\[\d+\])$`);
   auto c = match(j["name"].str, ctr);
   if (!c.empty) {
      j["name"] = c.captures[1];
      j["type"] = j["type"].str ~ c.captures[2];
   }
   return j;
}

void createBinddynamic(in string dir, JSONValue root) {
   import std.stdio : File;
   import std.path : buildPath;
   import std.string : chop, stripRight;
   import std.format : format;

   JSONValue[] fun = root["functions"].array;
   auto of = File(buildPath(dir, "binddynamic.d"), "w");

   void writeRem(JSONValue j, string space = "") {
      if (j["description"].str.length) {
         of.writefln("%s/// %s", space, j["description"].str);
      }
   }

   of.writeln("module bindbc.raylib.binddynamic;");
   of.writeln("");
   of.writeln("version (BindBC_Static) {");
   of.writeln("} else version (BindRaylib_Static) {");
   of.writeln("} else {");
   of.writeln("   version = BindRaylib_Dynamic;");
   of.writeln("}");
   of.writeln("");
   of.writeln("version (BindRaylib_Dynamic):");
   of.writeln("");
   of.writeln("import bindbc.loader;");
   of.writeln("import bindbc.raylib.types;");
   of.writeln("");
   of.writeln("extern (C) @nogc nothrow {");

   foreach (e; fun) {
      string fn = e["name"].str;
      if (fn.skipFunc) {
         continue;
      }

      trace(e);
      of.writef("   alias p%s = %s function(", fn, e["returnType"].str.convertType);
      string args;
      if ("params" in e) {
         foreach (p; e["params"].array) {
            args ~= format!("%s %s, ")(p["type"].str.convertType, p["name"].str);
         }
         of.write(args.stripRight.chop);
      }
      of.writeln(");");
   }
   of.writeln("}");
   of.writeln();
   of.writeln("__gshared {");
   //pdaveGetS8from daveGetS8from;
   foreach (e; fun) {
      string fn = e["name"].str;
      if (fn.skipFunc) {
         continue;
      }
      of.writefln("   p%s %s;", fn, fn);
   }
   of.writeln("}");
   string s = import("load.txt");
   of.writeln(s);
   foreach (e; fun) {
      string fn = e["name"].str;
      if (fn.skipFunc) {
         continue;
      }
      of.writefln(`   lib.bindSymbol(cast(void**)&%s, "%s");`, fn, fn);
   }

   string f = import("footer.txt");
   of.writeln(f);
}

void createBindstatic(in string dir, JSONValue root) {
   import std.stdio : File;
   import std.path : buildPath;
   import std.string : chop, stripRight;
   import std.format : format;

   JSONValue[] fun = root["functions"].array;
   auto of = File(buildPath(dir, "bindstatic.d"), "w");

   /**
    *
    */
   void writeRem(JSONValue j, string space = "") {
      if (j["description"].str.length) {
         of.writefln("%s/**", space);
         of.writefln("%s * %s", space, j["description"].str);
         of.writefln("%s */", space);
      }
   }

   of.writeln("module bindbc.raylib.bindstatic;");
   of.writeln("");
   of.writeln("version(BindBC_Static) version = BindRaylib_Static;");
   of.writeln("version(BindRaylib_Static):");
   of.writeln("");
   of.writeln("import bindbc.raylib.types;");
   of.writeln("extern (C) @nogc nothrow {");


   foreach (e; fun) {
      string fn = e["name"].str;
      if (fn.skipFunc) {
         continue;
      }

      writeRem(e, "   ");
      of.writef(  "   %s %s(", e["returnType"].str.convertType, fn);
      string args;
      if ("params" in e) {
         foreach (p; e["params"].array) {
            args ~= format!("%s %s, ")(p["type"].str.convertType, p["name"].str);
         }
         of.write(args.stripRight.chop);
      }
      of.writeln(");");
   }
   of.writeln("}");
   of.writeln();
}


size_t skipFunc(string fn) {
   import std.algorithm.comparison : among;
   return fn.among!(
               "SetLoadFileDataCallback",
               "SetLoadFileTextCallback",
               "SetSaveFileDataCallback",
               "SetSaveFileTextCallback",
               "SetTraceLogCallback",
               "TextFormat",
               "TraceLog",
               "TraceLogCallback",
               );
}

size_t skipEnum(string fn) {
   import std.algorithm.comparison : among;
   return fn.among!(
               "Vector2"
               );
}


string convertType(string cType) {
   import std.string : endsWith;
   if (cType.endsWith(" *")) {
      cType = cType[0 .. $ - 2] ~ "*";
   } else if (cType.endsWith(" **")) {
      cType = cType[0 .. $ - 3] ~ "**";
   }

   switch (cType) {
      case "unsigned char": return "ubyte";
      case "unsigned char*": return "ubyte*";
      case "unsigned short": return "ushort";
      case "unsigned short*": return "ushort*";

      case "unsigned int": return "uint";
      case "unsigned int*": return "uint*";
      case "const char": return "const(char)";
      case "const char*": return "const(char)*";
      case "const char**": return "const(char*)*";

      case "const unsigned char": return "const(ubyte)";
      case "const unsigned char*": return "const(ubyte)*";
      default: return cType;
   }
}

unittest {
   assert(convertType( "const char**") == "const(char*)*";
}
