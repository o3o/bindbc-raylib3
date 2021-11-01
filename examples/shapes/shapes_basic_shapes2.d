import std.stdio;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal == RaylibSupport.badLibrary) {
      foreach (info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {
      writeln("VERIOSN: ", retVal);
      writeln("loaded : ", loadedRaylibVersion);

      // Initialization
      //--------------------------------------------------------------------------------------
      const int screenWidth = 800;
      const int screenHeight = 450;

      InitWindow(screenWidth, screenHeight, "raylib [shapes] example - basic shapes drawing");

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second
      //--------------------------------------------------------------------------------------
    float timer = 0.;

      // Main game loop
      while (!WindowShouldClose()) {
         // Update

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         DrawText("some basic shapes available on raylib", 20, 20, 20, DARKGRAY);

         DrawCircle(screenWidth / 4, 120, 35, DARKBLUE);
         DrawCircle(screenWidth / 4, 120, 35, DARKBLUE);

         timer += GetFrameTime();
         if (timer > 540f) {
            timer = 0;
         }


         // NOTE: We draw all LINES based shapes together to optimize internal drawing,
         // this way, all LINES are rendered in a single draw pass
         //  void DrawCircleSectorLines(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);    // Draw circle sector outline
         Vector2 c = Vector2(screenWidth / 4, 340);
         DrawCircleSectorLines(c, 80, 180, 360 + 180 - cast(int)(timer * 10), 35, DARKBLUE);
         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      // De-Initialization
      //--------------------------------------------------------------------------------------
      CloseWindow(); // Close window and OpenGL context
      //--------------------------------------------------------------------------------------
   }
}
