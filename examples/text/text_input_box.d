import bindbc.raylib;
import loader = bindbc.loader.sharedlib;
import std.conv : to;
import std.format : format;
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
      enum SCREEN_HEIGHT = 480;
      enum MAX_INPUT_CHARS = 9;

      InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [text] example - input box");
      char[MAX_INPUT_CHARS + 1] name = 0x0; // NOTE: One extra space required for line ending char '\0'

      int letterCount = 0;

      Rectangle textBox = Rectangle(SCREEN_WIDTH / 2 - 100, 180, 225, 50);
      bool mouseOnText;
      int framesCounter = 0;

      SetTargetFPS(10);

      while (!WindowShouldClose()) {
         // Update
         if (CheckCollisionPointRec(GetMousePosition(), textBox)) {
            mouseOnText = true;
         } else {
            mouseOnText = false;
         }

         if (mouseOnText) {
            // Get pressed key (character) on the queue
            int key = GetKeyPressed();

            // Check if more characters have been pressed on the same frame
            while (key > 0) {
               // NOTE: Only allow keys in range [32..125]
               if ((key >= 32) && (key <= 125) && (letterCount < MAX_INPUT_CHARS)) {
                  name[letterCount] = cast(char)key;
                  letterCount++;
               }
               key = GetKeyPressed(); // Check next character in the queue
            }

            if (IsKeyPressed(KeyboardKey.KEY_BACKSPACE)) {
               letterCount--;
               name[letterCount] = '\0';

               if (letterCount < 0)
                  letterCount = 0;
            }
         }

         if (mouseOnText) {
            framesCounter++;
         } else {
            framesCounter = 0;
         }

         // Draw
         BeginDrawing();

         ClearBackground(RAYWHITE);

         DrawText("PLACE MOUSE OVER INPUT BOX!", 240, 140, 20, GRAY);

         DrawRectangleRec(textBox, LIGHTGRAY);
         if (mouseOnText) {
            DrawRectangleLines(textBox.x.to!int, textBox.y.to!int, textBox.width.to!int, textBox.height.to!int, RED);
         } else {
            DrawRectangleLines(textBox.x.to!int, textBox.y.to!int, textBox.width.to!int, textBox.height.to!int, DARKGRAY);
         }
const(char)* namep = name.to!(const(char[])).ptr;
         DrawText(namep, textBox.x.to!int + 5, textBox.y.to!int + 8, 40, MAROON);

         //DrawText(format("INPUT CHARS: %i/%i", letterCount, MAX_INPUT_CHARS).toStringz, 250, 20, DARKGRAY);

         if (mouseOnText) {
            if (letterCount < MAX_INPUT_CHARS) {
               // Draw blinking underscore char
               if (((framesCounter / 20) % 2) == 0) {
                  DrawText("_", to!int(textBox.x + 8 + MeasureText(namep, 40)), textBox.y.to!int + 12, 40, MAROON);
               }
            } else {
               DrawText("Press BACKSPACE to delete chars...", 230, 300, 20, GRAY);
            }
         }

         EndDrawing();
      }

      // De-Initialization
      CloseWindow(); // Close window and OpenGL context
   }
}
