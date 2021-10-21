import std.stdio;
import std.string : fromStringz, toStringz;
import bindbc.raylib;

import loader = bindbc.loader.sharedlib;
import std.experimental.logger;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();

   if (retVal != raylibSupport) {
      foreach(info; loader.errors) {
         error(fromStringz(info.error), ":", fromStringz(info.message));
      }
      writeln("ERROR: ", retVal);
   } else {
      writeln("VERSION: ", retVal);
      writeln("loaded : ", loadedRaylibVersion);

      // Initialization
      enum SCREEN_WIDTH = 800;
      enum SCREEN_HEIGHT = 450;

      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib3 [core] example - basic window");

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      // Main loop
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
