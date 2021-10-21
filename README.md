# bindbc-raylib3
This project provides both static and dynamic bindings to the [raylib](https://www.raylib.com/) _a simple and easy-to-use library to enjoy videogames programming_ and [raygui](https://github.com/raysan5/raygui) _a simple and easy-to-use immediate-mode-gui library_.

## Versioning
bindbc-raylib3 is being [semantically versioned](http://semver.org). Roughly described, major version changes will always represent backwards incompatible changes, minor version changes will always represent new features and will be backwards compatible, and patch ('tiny') version changes will always be bug fixes.

## Compile raylib source code
You can [just compile raylib](https://github.com/o3o/bindbc-raylib/wiki/compile-raylib) or also include [support for raygui](https://github.com/o3o/bindbc-raylib/wiki/compile-raygui).


## Usage
By default, `bindbc-raylib3` is configured to compile as a dynamic binding that is not `-betterC` compatible.
The dynamic binding has no link-time dependency on the raylib library, so the raylib shared library must be manually loaded at run time. When configured as a static binding, there is a link-time dependency on the raylib library---either the static library or the appropriate file for linking with shared libraries on your platform (see below).

When using DUB to manage your project, the static binding can be enabled via a DUB `subConfiguration` statement in your project's package file. `-betterC` compatibility is also enabled via subconfigurations.

To use raylib, add `bindbc-raylib3` as a dependency to your project's package config file. For example, the following is configured to compile raylib as a dynamic binding that is not `-betterC` compatible:

__dub.json__
```
dependencies {
    "bindbc-raylib3": "~>0.1.0",
}
```

__dub.sdl__
```
dependency "bindbc-raylib3" version="~>0.1.0"
```

### The dynamic binding
The dynamic binding requires no special configuration when using DUB to manage your project.
There is no link-time dependency.
At run time, the raylib shared library is required to be on the shared library search path of the user's system. On Windows, this is typically handled by distributing the raylib DLL with your program. On other systems, it usually means the user must install the raylib shared library through a package manager.

To load the shared library, you need to call the `loadRaylib` function.
This returns a member of the `RaylibSupport` enumeration (see [the README for `bindbc.loader`](https://github.com/BindBC/bindbc-loader/blob/master/README.md) for the error handling API):

* `RaylibSupport.noLibrary` indicating that the library failed to load (it couldn't be found)
* `RaylibSupport.badLibrary` indicating that one or more symbols in the library failed to load
* a member of `RaylibSupport` indicating a version number that matches the version of raylib that `bindbc-raylib3` was configured at compile-time to load.
By default, that is `RaylibSupport.raylib370`, but can be configured via a version identifier (see below). This value will match the global manifest constant, `raylibSupport`.
```d
import bindbc.raylib3;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   // raylibSupport is an enum with current raylib version
   if (retVal != raylibSupport) {
      // Handle error. For most use cases, its reasonable to use the the error handling API in
      // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
      // possible to determine the root cause via the return value:
      if (ret == RaylibSupport.noLibrary) {
        // raylib shared library failed to load
       } else if (RaylibSupport.badLibrary) {
        // One or more symbols failed to load. The likely cause is that the
        // shared library is for a lower version than bindbc-raylib was configured
        // to load.
      }
   } else {
      // successful
   }
}
```
```
/*
This version attempts to load the raylib library using a user-supplied file name.
Usually, the name and/or path used will be platform specific, as in this example
which attempts to load `raylib.dll` from the `libs` subdirectory, relative
to the executable, only on Windows.
*/
// version(Windows) loadraylib("libs/raylib.dll")
```

By default, the `bindbc-raylib` binding is configured to load raylib 3.7.0.
This behavior can be overridden via the `-version` compiler switch or the `versions` DUB directive with the desired raylib version number.
In this next example, the raylib dynamic binding is compiled to support raylib 3.7.0:

__dub.json__
```
"dependencies": {
    "bindbc-raylib": "~>0.1.0"
},
"versions": ["RAYLIB_370"]
```

__dub.sdl__
```
dependency "bindbc-raylib" version="~>0.1.0"
versions "RAYLIB_370"
```

With this example configuration, `raylibSupport == RaylibSupport.raylib370` on a successful load.

If raylib 3.7.0 or later is installed on the user's system, `loadRaylib` will return `RaylibSupport.raylib370`.
If raylib 3.6.0 is found instead, `loadRaylib` will return `RaylibSupport.badLibrary`.
In this scenario, calling `loadedRaylibVersion()` will return a `RaylibSupport` member indicating which version of raylib, if any, actually loaded.
If a lower version was loaded, it's still possible to call functions from that version of raylib, but any calls to functions from higher versions will result in a null pointer access.
For this reason, it's recommended to always specify your required version of the raylib library at compile time and abort when you receive an `RaylibSupport.badLibrary` return value from `loadRaylib`.

No matter which version was configured, the successfully loaded version can be obtained via a call to `loadedRaylibVersion`. It returns one of the following:

* `RaylibSupport.noLibrary` if `loadRaylib` returned `RaylibSupport.noLibrary`
* `RaylibSupport.badLibrary` if `loadraylib` returned `RaylibSupport.badLibrary` and no version of raylib successfully loaded
* a member of `RaylibSupport` indicating the version of raylib that successfully loaded.
  When `loadRaylib` returns `RaylibSupport.badLibrary`, this will be a version number lower than that configured at compile time. Otherwise, it will be the same as the manifest constant `raylibSupport`.

The function `isRaylibLoaded` returns `true` if any version of raylib was successfully loaded and `false` otherwise.

Following are the supported versions of raylib, the corresponding version IDs to pass to the compiler, and the corresponding `RaylibSupport` members.

| Library & Version  | Version ID       | `RaylibSupport` Member |
|--------------------|------------------|--------------------|
| raylib 3.7.0      | Raylib_370 (Default) | `RaylibSupport.raylib370`  |

## The static binding
The static binding has a link-time dependency on either the shared or the static raylib library.
On Windows, you can link with the static library or, to use the shared library (`raylib.dll`), with the import library.

On other systems, you can link with either the static library or directly with the shared library. This requires the raylib development package be installed on your system at compile time, either by compiling the raylib source yourself, downloading the raylib precompiled binaries for Windows, or installing via a system package manager.

When linking with the static library, there is no run-time dependency on raylib.
When linking with the shared library (or the import library on Windows), the run-time dependency is the same as the dynamic binding, the difference being that the shared library is no longer loaded manually&mdash;loading is handled automatically by the system when the program is launched.

Enabling the static binding can be done in two ways.

### Via the compiler's `-version` switch 

Pass the `BindRaylib_Static` version to the compiler and link with the appropriate library.

Using the compiler command line or a build system that doesn't support DUB, the `-version=BindRaylib_Static` option should be passed to the compiler when building your program.
All of the required C libraries, as well as the `bindbc-raylib3` and `bindbc-loader` static libraries, must also be passed to the compiler on the command line or via your build system's configuration.

### Via DUB's `versions` directive
Using DUB, set the `BindRaylib_Static` version via its `versions` directive and  the required libraries in the `libs` directive. For example:

__dub.json__
```
"dependencies": {
    "bindbc-raylib3": "~>0.1.0"
},
"versions": ["BindRaylib_Static"],
"libs": ["libraylib"]
```

__dub.sdl__
```
dependency "bindbc-raylib3" version="~>0.1.0"
versions "BindRaylib_Static"
libs "libraylib"
```

The above example only links to the raylib library, meaning it is linking with either the shared library or, on Windows, the import library for the DLL.
When linking with the raylib static library, any dependencies it has must also be added to the `libs` directive.

## Examples
You can find [original raylib examples](https://www.raylib.com/examples.html) ported to D inside [examples directory](https://github.com/o3o/bindbc-raylib3/tree/master/examples).

A simple example:

```d
import std.stdio;
import bindbc.raylib3;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport) {
      writeln("ERROR: ", retVal);
   } else {
      writeln("VERSION: ", retVal);
      writeln("loaded : ", loadedRaylibVersion);

      enum SCREEN_WIDTH = 800;
      enum SCREEN_HEIGHT = 450;

      // Initialization
      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - basic window");

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      // Main game loop
      while (!WindowShouldClose()) {
         // Draw
         BeginDrawing();
         ClearBackground(GOLD);
         DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY);
         EndDrawing();
      }
      CloseWindow();
   }
}
```

## Dependencies
- [bindbc-loader](https://github.com/BindBC/bindbc-loader)
