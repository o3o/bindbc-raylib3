import std.stdio;
import raylib;
import std.format : format;
import std.string : toStringz;

void main(string[] args) {
   // Initialization
   enum SCREEN_WIDTH = 800;
   enum SCREEN_HEIGHT = 450;

   InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "raylib [core] example - input multitouch");
   Vector2 ballPosition = Vector2(-100.0f, -100.0f);
   Color ballColor = BEIGE;

   int touchCounter = 0;
   Vector2 touchPosition;
   SetTargetFPS(60); // Set our game to run at 60 frames-per-second

   // Main game loop
   while (!WindowShouldClose()) {
      ballPosition = GetMousePosition();
      if (IsMouseButtonDown(MouseButton.MOUSE_LEFT_BUTTON))
         ballColor = MAROON;
      if (IsMouseButtonDown(MouseButton.MOUSE_MIDDLE_BUTTON))
         ballColor = LIME;
      if (IsMouseButtonDown(MouseButton.MOUSE_RIGHT_BUTTON))
         ballColor = DARKBLUE;

      if (IsMouseButtonPressed(MouseButton.MOUSE_LEFT_BUTTON))
         touchCounter = 10;
      if (IsMouseButtonPressed(MouseButton.MOUSE_MIDDLE_BUTTON))
         touchCounter = 10;
      if (IsMouseButtonPressed(MouseButton.MOUSE_RIGHT_BUTTON))
         touchCounter = 10;

      if (touchCounter > 0)
         touchCounter--;

      // Draw
      BeginDrawing();
      ClearBackground(RAYWHITE);

      // Multitouch
      for (int i = 0; i < MAX_TOUCH_POINTS; ++i) {
         touchPosition = GetTouchPosition(i); // Get the touch point

         if ((touchPosition.x >= 0) && (touchPosition.y >= 0)) // Make sure point is not (-1,-1) as this means there is no touch for it
         {
            // Draw circle and touch index number
            DrawCircleV(touchPosition, 34, ORANGE);
            drawText("%d".format(i), touchPosition.x - 10, touchPosition.y - 70, 40, BLACK);
         }
      }

      // Draw the normal mouse location
      DrawCircleV(ballPosition, 30 + (touchCounter * 3), ballColor);

      DrawText("move ball with mouse and click mouse button to change color", 10, 10, 20, DARKGRAY);
      DrawText("touch the screen at multiple locations to get multiple balls", 10, 30, 20, DARKGRAY);

      EndDrawing();
   }

   // De-Initialization
   CloseWindow(); // Close window and OpenGL context
}

void drawText(string text, float posX, float posY, int fontSize, Color color) {
   import std.string : toStringz;
   import std.conv : to;
   DrawText(toStringz(text) , posX.to!int, posY.to!int, fontSize, color);
}

