import std.stdio;
import std.conv : to;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;

enum MAX_PARTICLES = 200;

// Particle structure with basic data
struct Particle {
   Vector2 position;
   Color color;
   float alpha;
   float size;
   float rotation;
   bool active; // NOTE: Use it to activate/deactive particle
}

int main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   writefln("loadRaylib ret %s", retVal);

   if (retVal != raylibSupport) {
      foreach (info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {

      // Initialization
      //--------------------------------------------------------------------------------------
      enum int screenWidth = 800;
      enum int screenHeight = 450;

      InitWindow(screenWidth, screenHeight, "raylib [textures] example - particles blending");
      scope (exit)
         CloseWindow(); // Close window and OpenGL context on exit

      // Particles pool, reuse them!
      Particle[MAX_PARTICLES] mouseTail;

      // Initialize particles
      for (int i = 0; i < MAX_PARTICLES; i++) {
         mouseTail[i].position = Vector2(0, 0);
         mouseTail[i].color = Color(GetRandomValue(0, 255), GetRandomValue(0, 255), GetRandomValue(0, 255), 255);
         mouseTail[i].alpha = 1.0f;
         mouseTail[i].size = GetRandomValue!float(1, 30) / 20.0f;
         mouseTail[i].rotation = GetRandomValue!float(0, 360);
         mouseTail[i].active = false;
      }

      float gravity = 3.0f;

      Texture2D smoke = LoadTexture("resources/spark_flame.png");
      scope (exit)
         UnloadTexture(smoke);

      int blending = BlendMode.BLEND_ALPHA;

      SetTargetFPS(60);
      //--------------------------------------------------------------------------------------

      // Main game loop
      while (!WindowShouldClose()) {
         // Update
         //----------------------------------------------------------------------------------

         // Activate one particle every frame and Update active particles
         // NOTE: Particles initial position should be mouse position when activated
         // NOTE: Particles fall down with gravity and rotation... and disappear after 2 seconds (alpha = 0)
         // NOTE: When a particle disappears, active = false and it can be reused.
         for (int i = 0; i < MAX_PARTICLES; i++) {
            if (!mouseTail[i].active) {
               mouseTail[i].active = true;
               mouseTail[i].alpha = 1.0f;
               mouseTail[i].position = GetMousePosition();
               i = MAX_PARTICLES;
            }
         }

         for (int i = 0; i < MAX_PARTICLES; i++) {
            if (mouseTail[i].active) {
               mouseTail[i].position.y += gravity / 2;
               mouseTail[i].alpha -= 0.005f;

               if (mouseTail[i].alpha <= 0.0f)
                  mouseTail[i].active = false;

               mouseTail[i].rotation += 2.0f;
            }
         }

         if (IsKeyPressed(KeyboardKey.KEY_SPACE)) {
            if (blending == BlendMode.BLEND_ALPHA) {
               blending = BlendMode.BLEND_ADDITIVE;
            } else {
               blending = BlendMode.BLEND_ALPHA;
            }
         }
         //----------------------------------------------------------------------------------

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(DARKGRAY);

         BeginBlendMode(blending);

         // Draw active particles
         for (int i = 0; i < MAX_PARTICLES; i++) {
            if (mouseTail[i].active) {
               // dfmt off

               DrawTexturePro(smoke,
                     Rectangle(0.0f, 0.0f, to!(float)(smoke.width), to!(float)(smoke.height)),
                     Rectangle(mouseTail[i].position.x, mouseTail[i].position.y, smoke.width * mouseTail[i].size, smoke.height * mouseTail[i].size),
                     Vector2(to!(float)(smoke.width * mouseTail[i].size / 2.0f), to!(float)(smoke.height * mouseTail[i].size / 2.0f)),
                     mouseTail[i].rotation,
                     Fade(mouseTail[i].color, mouseTail[i].alpha)
                     );
               // dfmt on
            }
         }
         EndBlendMode();

         DrawText("PRESS SPACE to CHANGE BLENDING MODE", 180, 20, 20, BLACK);

         if (blending == BlendMode.BLEND_ALPHA)
            DrawText("ALPHA BLENDING", 290, screenHeight - 40, 20, BLACK);
         else
            DrawText("ADDITIVE BLENDING", 280, screenHeight - 40, 20, RAYWHITE);

         EndDrawing();
      }
   }
   return 0;
}

T GetRandomValue(T = ubyte)(int min, int max) {
   import std.random : uniform;

   return uniform(min, max).to!T();
}
