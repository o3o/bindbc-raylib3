import bindbc.raylib;
import loader = bindbc.loader.sharedlib;
import std.experimental.logger;
import std.stdio;
import std.string : toStringz;

void main(string[] args) {
   RaylibSupport retVal = loadRaylib();
   if (retVal == RaylibSupport.badLibrary) {
      foreach (info; loader.errors) {
         writefln("e: %s, m:%s", info.error, info.message);
      }
      writeln("ERROR: ", retVal);
   } else {

      // Initialization
      //--------------------------------------------------------------------------------------
      const int screenWidth = 400;
      const int screenHeight = 200;

      InitWindow(screenWidth, screenHeight, "raylib [core] example - input gestures");

      Vector2 touchPosition = Vector2(0, 0);

      int gesturesCount = 0;

      int currentGesture = Gesture.GESTURE_NONE;
      int lastGesture = Gesture.GESTURE_NONE;

      //SetGesturesEnabled(0b0000000000001001);   // Enable only some gestures to be detected

      SetTargetFPS(60); // Set our game to run at 60 frames-per-second
      //--------------------------------------------------------------------------------------

      // Main game loop
      while (!WindowShouldClose()) {
         // Update
         //----------------------------------------------------------------------------------
         lastGesture = currentGesture;
         currentGesture = GetGestureDetected();
         touchPosition = GetTouchPosition(0);

         if (currentGesture != Gesture.GESTURE_NONE) {
            if (currentGesture != lastGesture) {
               switch (currentGesture) {
                  case Gesture.GESTURE_TAP:
                     tracef("GESTURE TAP");
                     break;
                  case Gesture.GESTURE_DOUBLETAP:
                     tracef("GESTURE DOUBLETAP");
                     break;
                  case Gesture.GESTURE_HOLD:
                     tracef("GESTURE HOLD");
                     break;
                  case Gesture.GESTURE_DRAG:
                     tracef("GESTURE DRAG");
                     break;
                  case Gesture.GESTURE_SWIPE_RIGHT:
                     tracef("GESTURE SWIPE RIGHT");
                     break;
                  case Gesture.GESTURE_SWIPE_LEFT:
                     tracef("GESTURE SWIPE LEFT");
                     break;
                  case Gesture.GESTURE_SWIPE_UP:
                     tracef("GESTURE SWIPE UP");
                     break;
                  case Gesture.GESTURE_SWIPE_DOWN:
                     tracef("GESTURE SWIPE DOWN");
                     break;
                  case Gesture.GESTURE_PINCH_IN:
                     tracef("GESTURE PINCH IN");
                     break;
                  case Gesture.GESTURE_PINCH_OUT:
                     tracef("GESTURE PINCH OUT");
                     break;
                  default:
                     break;
               }
               tracef("pos:%s", touchPosition);
            }
         }

         // Draw
         //----------------------------------------------------------------------------------
         BeginDrawing();

         ClearBackground(RAYWHITE);

         if (currentGesture != Gesture.GESTURE_NONE)
            DrawCircleV(touchPosition, 20, MAROON);

         EndDrawing();
         //----------------------------------------------------------------------------------
      }

      // De-Initialization
      //--------------------------------------------------------------------------------------
      CloseWindow(); // Close window and OpenGL context
      //--------------------------------------------------------------------------------------
   }
}
