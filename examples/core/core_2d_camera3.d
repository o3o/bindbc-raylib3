import std.stdio;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;
import std.experimental.logger;

void main(string[] args) {
   import std.random : uniform;
   import std.conv : to;

   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport) {
      foreach (info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {

      // Initialization
      enum MAX_BUILDINGS = 4;
      enum SCREEN_WIDTH = 800;
      enum BLOCK_HEIGHT = 200;
      enum SCREEN_HEIGHT = 400;
      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 2d window");

      Rectangle player = Rectangle(400, 280, 40, 40);
      Rectangle[MAX_BUILDINGS] buildings;
      Color[MAX_BUILDINGS] buildColors;

      int spacing = 0;
      for (int i = 0; i < MAX_BUILDINGS; i++) {
         buildings[i].width = SCREEN_WIDTH;
         buildings[i].height = BLOCK_HEIGHT;
         buildings[i].y = i * BLOCK_HEIGHT;
         buildings[i].x = 0;
      }
      enum CAM_X = SCREEN_WIDTH / 2;
      enum CAM_Y_ON = 200;
      enum CAM_Y_OFF =  600;

      Camera2D camera;
      camera.target = Vector2(CAM_X, CAM_Y_OFF);
      camera.offset = Vector2(CAM_X, CAM_Y_OFF);
      camera.rotation = 0.0f;
      camera.zoom = 1.0f;

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      while (!WindowShouldClose()) { // Detect window close button or ESC key
         if (IsKeyPressed(KeyboardKey.KEY_UP)) {
            camera.target = Vector2(CAM_X, CAM_Y_ON);
            tracef("UP %s", camera);
         } else if (IsKeyPressed(KeyboardKey.KEY_DOWN)) {
            camera.target = Vector2(CAM_X, CAM_Y_OFF);
            tracef("DOWN %s", camera);
         }
         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         DrawRectangleRec(buildings[0], BLUE);
         //DrawRectangleRec(buildings[1], RED);

         BeginMode2D(camera);
            DrawRectangleRec(buildings[2], YELLOW);
         EndMode2D();

         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      CloseWindow(); // Close window and OpenGL context

   }
}
