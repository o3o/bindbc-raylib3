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
      Camera2D camera;
      camera.target = Vector2(CAM_X, SCREEN_HEIGHT / 2);
      camera.offset = Vector2(CAM_X, SCREEN_HEIGHT / 2);
      camera.rotation = 0.0f;
      camera.zoom = 1.0f;

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      while (!WindowShouldClose()) { // Detect window close button or ESC key
         if (IsKeyPressed(KeyboardKey.KEY_UP)) {
            camera.target = Vector2(CAM_X, camera.target.y  + BLOCK_HEIGHT /2);
            tracef("UP %s", camera);
         } else if (IsKeyPressed(KeyboardKey.KEY_DOWN)) {
            camera.target = Vector2(CAM_X, camera.target.y  - BLOCK_HEIGHT/2);
            tracef("DOWN %s", camera);
         }
         if (IsKeyPressed(KeyboardKey.KEY_LEFT)) {
            camera.offset = Vector2(CAM_X, camera.target.y  + BLOCK_HEIGHT);
            tracef("OFF LEFT %s", camera);
         } else if (IsKeyPressed(KeyboardKey.KEY_RIGHT)) {
            camera.offset = Vector2(CAM_X, camera.target.y  - BLOCK_HEIGHT);
            tracef("RIG %s", camera);
         }


         // Camera target follows player

         // Camera rotation controls
         if (IsKeyDown(KeyboardKey.KEY_A))
            camera.rotation--;
         else if (IsKeyDown(KeyboardKey.KEY_S))
            camera.rotation++;

         // Limit camera rotation to 80 degrees (-40 to 40)
         if (camera.rotation > 40)
            camera.rotation = 40;
         else if (camera.rotation < -40)
            camera.rotation = -40;

         // Camera zoom controls
         camera.zoom += GetMouseWheelMove().to!float() * 0.05f;

         if (camera.zoom > 3.0f)
            camera.zoom = 3.0f;
         else if (camera.zoom < 0.1f)
            camera.zoom = 0.1f;

         // Camera reset (zoom and rotation)
         if (IsKeyPressed(KeyboardKey.KEY_R)) {
            camera.zoom = 1.0f;
            camera.rotation = 0.0f;
         }
         //----------------------------------------------------------------------------------

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         BeginMode2D(camera);

            DrawRectangleRec(buildings[0], BLUE);
            DrawRectangleRec(buildings[1], RED);
            DrawRectangleRec(buildings[2], YELLOW);
            DrawRectangleRec(buildings[3], GREEN);

         EndMode2D();

         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      CloseWindow(); // Close window and OpenGL context

   }
}
