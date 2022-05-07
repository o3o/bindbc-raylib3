import std.stdio;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;

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
      enum MAX_BUILDINGS = 6;
      enum SCREEN_WIDTH = 800;
      enum SCREEN_HEIGHT = 450;
      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - 2d window");

      Rectangle player = Rectangle(400, 280, 40, 40);
      Rectangle[MAX_BUILDINGS] buildings;
      Color[MAX_BUILDINGS] buildColors;

      int spacing = 0;
      for (int i = 0; i < MAX_BUILDINGS; i++) {
         buildings[i].width = uniform(50, 200);
         buildings[i].height = uniform(100, 800);
         buildings[i].y = SCREEN_HEIGHT - 130 - buildings[i].height;
         buildings[i].x = -6000 + spacing;

         spacing += buildings[i].width.to!int();

         buildColors[i] = Color(uniform(200, 240).to!ubyte(), uniform(200, 240).to!ubyte(), uniform(200, 250).to!ubyte(), 255);
      }

      Camera2D camera;
      camera.target = Vector2(player.x + 20, player.y + 20);
      camera.offset = Vector2(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2);
      camera.rotation = 0.0f;
      camera.zoom = 1.0f;

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second

      while (!WindowShouldClose()) { // Detect window close button or ESC key
         if (IsKeyDown(KEY_RIGHT)) {
            player.x += 2;
         } else if (IsKeyDown(KEY_LEFT)) {
            player.x -= 2;
         }

         // Camera target follows player
         camera.target = Vector2(player.x + 20, player.y + 20);

         // Camera rotation controls
         if (IsKeyDown(KEY_A))
            camera.rotation--;
         else if (IsKeyDown(KEY_S))
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
         if (IsKeyPressed(KEY_R)) {
            camera.zoom = 1.0f;
            camera.rotation = 0.0f;
         }
         //----------------------------------------------------------------------------------

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         BeginMode2D(camera);
         DrawRectangle(-6000, 320, 13000, 8000, DARKGRAY);

         for (int i = 0; i < MAX_BUILDINGS; i++)
            DrawRectangleRec(buildings[i], buildColors[i]);

         DrawRectangleRec(player, RED);

         DrawLine(camera.target.x.to!int(), -SCREEN_HEIGHT * 10, camera.target.x.to!int(), SCREEN_HEIGHT * 10, GREEN);
         DrawLine(-SCREEN_WIDTH * 10, camera.target.y.to!int(), SCREEN_WIDTH * 10, camera.target.y.to!int(), GREEN);

         EndMode2D();

         DrawText("SCREEN AREA", 640, 10, 20, RED);

         DrawRectangle(0, 0, SCREEN_WIDTH, 5, RED);
         DrawRectangle(0, 5, 5, SCREEN_HEIGHT - 10, RED);
         DrawRectangle(SCREEN_WIDTH - 5, 5, 5, SCREEN_HEIGHT - 10, RED);
         DrawRectangle(0, SCREEN_HEIGHT - 5, SCREEN_WIDTH, 5, RED);

         DrawRectangle(10, 10, 250, 113, Fade(SKYBLUE, 0.5f));
         DrawRectangleLines(10, 10, 250, 113, BLUE);

         DrawText("Free 2d camera controls:", 20, 20, 10, BLACK);
         DrawText("- Right/Left to move Offset", 40, 40, 10, DARKGRAY);
         DrawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, DARKGRAY);
         DrawText("- A / S to Rotate", 40, 80, 10, DARKGRAY);
         DrawText("- R to reset Zoom and Rotation", 40, 100, 10, DARKGRAY);

         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      CloseWindow(); // Close window and OpenGL context

   }
}
