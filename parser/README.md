#  Parser

The [original parser](https://github.com/raysan5/raylib/tree/master/parser) generates json file:
```json
 "functions": [
    {
      "name": "InitWindow",
      "description": "Initialize window and OpenGL context",
      "returnType": "void",
      "params": {
        "width": "int",
        "height": "int",
        "title": "const char *"
      }
    },
```
and this is a problem for JSONValue, because the associative array `params` does not respect the order of the elements.

The patch changes json format in:
```json
"functions": [
    {
      "name": "InitWindow",
      "description": "Initialize window and OpenGL context",
      "returnType": "void",
      "params": [
        {"name": "width",  "type": "int" },
        {"name": "height",  "type": "int" },
        {"name": "title",  "type": "const char *" }
      ]
    },

```

## Apply patch
```
$ patch -b raylib_parser.c < raylib.patch
```
``
## Convert
```
$ make
```
Make creates two files in `src` directory
- binddynamic.d
- types.d
