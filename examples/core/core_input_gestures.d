import std.stdio;
import bindbc.raylib;
import loader = bindbc.loader.sharedlib;
import std.string : toStringz;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal != raylibSupport) {
      foreach(info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {

      enum MAX_GESTURE_STRINGS = 20;

      // Initialization
      //--------------------------------------------------------------------------------------
      const int screenWidth = 800;
      const int screenHeight = 450;

      InitWindow(screenWidth, screenHeight, "raylib [core] example - input gestures");

      Vector2 touchPosition = Vector2(0, 0 );
      Rectangle touchArea = Rectangle(220, 10, screenWidth - 230, screenHeight - 20 );

      int gesturesCount = 0;
      string[MAX_GESTURE_STRINGS] gestureStrings;

      int currentGesture = Gesture.GESTURE_NONE;
      int lastGesture = Gesture.GESTURE_NONE;

      //SetGesturesEnabled(0b0000000000001001);   // Enable only some gestures to be detected

      SetTargetFPS(60);               // Set our game to run at 60 frames-per-second
      //--------------------------------------------------------------------------------------

      // Main game loop
      while (!WindowShouldClose())    {
         // Update
         //----------------------------------------------------------------------------------
         lastGesture = currentGesture;
         currentGesture = GetGestureDetected();
         touchPosition = GetTouchPosition(0);

         if (CheckCollisionPointRec(touchPosition, touchArea) && (currentGesture != Gesture.GESTURE_NONE)) {
            if (currentGesture != lastGesture) {
               // Store gesture string
               switch (currentGesture) {

                  case Gesture.GESTURE_TAP         : gestureStrings[gesturesCount] = "GESTURE TAP"; break;
                  case Gesture.GESTURE_DOUBLETAP   : gestureStrings[gesturesCount] = "GESTURE DOUBLETAP"; break;
                  case Gesture.GESTURE_HOLD        : gestureStrings[gesturesCount] = "GESTURE HOLD"; break;
                  case Gesture.GESTURE_DRAG        : gestureStrings[gesturesCount] = "GESTURE DRAG"; break;
                  case Gesture.GESTURE_SWIPE_RIGHT : gestureStrings[gesturesCount] = "GESTURE SWIPE RIGHT"; break;
                  case Gesture.GESTURE_SWIPE_LEFT  : gestureStrings[gesturesCount] = "GESTURE SWIPE LEFT"; break;
                  case Gesture.GESTURE_SWIPE_UP    : gestureStrings[gesturesCount] = "GESTURE SWIPE UP"; break;
                  case Gesture.GESTURE_SWIPE_DOWN  : gestureStrings[gesturesCount] = "GESTURE SWIPE DOWN"; break;
                  case Gesture.GESTURE_PINCH_IN    : gestureStrings[gesturesCount] = "GESTURE PINCH IN"; break;
                  case Gesture.GESTURE_PINCH_OUT   : gestureStrings[gesturesCount] = "GESTURE PINCH OUT"; break;
                  default                  : break;

               }

               gesturesCount++;

               // Reset gestures strings
               if (gesturesCount >= MAX_GESTURE_STRINGS) {
                  for (int i = 0; i < MAX_GESTURE_STRINGS; i++) gestureStrings[i] = "" ;
                  gesturesCount = 0;
               }
            }
         }
         //----------------------------------------------------------------------------------

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         DrawRectangleRec(touchArea, GRAY);
         DrawRectangle(225, 15, screenWidth - 240, screenHeight - 30, RAYWHITE);

         DrawText("GESTURES TEST AREA", screenWidth - 270, screenHeight - 40, 20, Fade(GRAY, 0.5f));

         for (int i = 0; i < gesturesCount; i++) {
            if (i%2 == 0) {
               DrawRectangle(10, 30 + 20*i, 200, 20, Fade(LIGHTGRAY, 0.5f));
            } else {
               DrawRectangle(10, 30 + 20*i, 200, 20, Fade(LIGHTGRAY, 0.3f));
            }

            if (i < gesturesCount - 1) {
               DrawText(gestureStrings[i].toStringz, 35, 36 + 20*i, 10, DARKGRAY);
            } else {
               DrawText(gestureStrings[i].toStringz, 35, 36 + 20*i, 10, MAROON);
            }
         }

         DrawRectangleLines(10, 29, 200, screenHeight - 50, GRAY);
         DrawText("DETECTED GESTURES", 50, 15, 10, GRAY);

         if (currentGesture != Gesture.GESTURE_NONE) DrawCircleV(touchPosition, 30, MAROON);

         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      // De-Initialization
      //--------------------------------------------------------------------------------------
      CloseWindow();        // Close window and OpenGL context
      //--------------------------------------------------------------------------------------
   }
}
