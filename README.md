# bindbc-raylib3
This project provides both static and dynamic bindings to the [raylib](https://www.raylib.com/) [v4.0.0](https://github.com/raysan5/raylib/releases/tag/4.0.0)  _a simple and easy-to-use library to enjoy videogames programming_.

## Documentation
See [wiki](https://github.com/o3o/bindbc-raylib3/wiki).

## Compile raylib source code
See [raylib wiki](https://github.com/raysan5/raylib/wiki) and
[bindbc wiki](https://github.com/o3o/bindbc-raylib3/wiki/compile-raylib)


## Usage
By default, `bindbc-raylib3` is configured to compile as a _dynamic binding_ that is not `-betterC` compatible.
The dynamic binding has no link-time dependency on the raylib library, so the raylib shared library must be manually loaded at run time.

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

### Loading raylib
The `loadRaylib` function is used to load all supported raylib functions.
The return value of `loadRaylib` can be used to determine which version of raylib actually loaded.
```d
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   // raylibSupport is an enum with current raylib version
   if (retVal != raylibSupport) {
      // error
   } else {
      // successful
   }
}
```

For static binding see [wiki](https://github.com/o3o/bindbc-raylib3/wiki/the-static-binding)

## Raylib version
Following are the `bindbc-raylib3` versions, the supported versions of raylib and the corresponding `RaylibSupport` members.

| bindbc-raylib3 version | Raylib version       | `RaylibSupport` Member    |
| ---                    | -------------------- | --------------------      |
| 0.5.0                  | 4.0.0                | `RaylibSupport.raylib400` |
| 0.4.0                  | 4.0.0                | `RaylibSupport.raylib400` |
| 0.3.0                  | 3.7.0                | `RaylibSupport.raylib370` |

For bind-raylib3 version see [wiki](https://github.com/o3o/bindbc-raylib3/wiki/version)

## Versioning
bindbc-raylib3 is being [semantically versioned](http://semver.org). Roughly described, major version changes will always represent backwards incompatible changes, minor version changes will always represent new features and will be backwards compatible, and patch ('tiny') version changes will always be bug fixes.

## Examples
You can find [original raylib examples](https://www.raylib.com/examples.html) ported to D inside [examples directory](https://github.com/o3o/bindbc-raylib3/tree/master/examples).

A simple example:

```d
import std.stdio;
import bindbc.raylib;

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
