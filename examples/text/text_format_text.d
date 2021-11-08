import bindbc.raylib;
import loader = bindbc.loader.sharedlib;
import std.conv : to;
import std.format;
import std.stdio;
import std.string : toStringz;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport) {
      foreach (info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {
      // Initialization
      enum SCREEN_WIDTH = 800;
      enum SCREEN_HEIGHT = 450;

      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - text formatting");


      int score = 100020;
      int hiscore = 200450;
      int lives = 5;

      SetTargetFPS(30);               // Set our game to run at 60 frames-per-second
      //--------------------------------------------------------------------------------------

      // Main game loop
      while (!WindowShouldClose())    {
         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(BLACK);

         DrawText(format("Score: %08d", score).toStringz, 200, 80, 20, RED);
         DrawText(format("HiScore: %08d", hiscore).toStringz, 200, 120, 20, GREEN);
         DrawText(format("Lives: %02d", lives).toStringz, 200, 160, 40, BLUE);
         DrawText(format("Elapsed Time: %02.02f ms", GetFrameTime()*1000).toStringz, 200, 220, 20, WHITE);
         DrawText("New Time: %02.02f s".format(GetFrameTime()).toStringz, 200, 260, 20, YELLOW);

         EndDrawing();
      }

      CloseWindow();        // Close window and OpenGL context
   }
}
