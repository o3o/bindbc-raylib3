module bindbc.raylib.bindstatic;

version(BindBC_Static) version = BindRaylib_Static;
version(BindRaylib_Static):

import bindbc.raylib.types;
extern (C) @nogc nothrow {
   /**
    * Initialize window and OpenGL context
    */
   void InitWindow(int width, int height, const(char)* title);
   /**
    * Check if KEY_ESCAPE pressed or Close icon pressed
    */
   bool WindowShouldClose();
   /**
    * Close window and unload OpenGL context
    */
   void CloseWindow();
   /**
    * Check if window has been initialized successfully
    */
   bool IsWindowReady();
   /**
    * Check if window is currently fullscreen
    */
   bool IsWindowFullscreen();
   /**
    * Check if window is currently hidden (only PLATFORM_DESKTOP)
    */
   bool IsWindowHidden();
   /**
    * Check if window is currently minimized (only PLATFORM_DESKTOP)
    */
   bool IsWindowMinimized();
   /**
    * Check if window is currently maximized (only PLATFORM_DESKTOP)
    */
   bool IsWindowMaximized();
   /**
    * Check if window is currently focused (only PLATFORM_DESKTOP)
    */
   bool IsWindowFocused();
   /**
    * Check if window has been resized last frame
    */
   bool IsWindowResized();
   /**
    * Check if one specific window flag is enabled
    */
   bool IsWindowState(uint flag);
   /**
    * Set window configuration state using flags
    */
   void SetWindowState(uint flags);
   /**
    * Clear window configuration state flags
    */
   void ClearWindowState(uint flags);
   /**
    * Toggle window state: fullscreen/windowed (only PLATFORM_DESKTOP)
    */
   void ToggleFullscreen();
   /**
    * Set window state: maximized, if resizable (only PLATFORM_DESKTOP)
    */
   void MaximizeWindow();
   /**
    * Set window state: minimized, if resizable (only PLATFORM_DESKTOP)
    */
   void MinimizeWindow();
   /**
    * Set window state: not minimized/maximized (only PLATFORM_DESKTOP)
    */
   void RestoreWindow();
   /**
    * Set icon for window (only PLATFORM_DESKTOP)
    */
   void SetWindowIcon(Image image);
   /**
    * Set title for window (only PLATFORM_DESKTOP)
    */
   void SetWindowTitle(const(char)* title);
   /**
    * Set window position on screen (only PLATFORM_DESKTOP)
    */
   void SetWindowPosition(int x, int y);
   /**
    * Set monitor for the current window (fullscreen mode)
    */
   void SetWindowMonitor(int monitor);
   /**
    * Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
    */
   void SetWindowMinSize(int width, int height);
   /**
    * Set window dimensions
    */
   void SetWindowSize(int width, int height);
   /**
    * Get native window handle
    */
   void* GetWindowHandle();
   /**
    * Get current screen width
    */
   int GetScreenWidth();
   /**
    * Get current screen height
    */
   int GetScreenHeight();
   /**
    * Get number of connected monitors
    */
   int GetMonitorCount();
   /**
    * Get current connected monitor
    */
   int GetCurrentMonitor();
   /**
    * Get specified monitor position
    */
   Vector2 GetMonitorPosition(int monitor);
   /**
    * Get specified monitor width (max available by monitor)
    */
   int GetMonitorWidth(int monitor);
   /**
    * Get specified monitor height (max available by monitor)
    */
   int GetMonitorHeight(int monitor);
   /**
    * Get specified monitor physical width in millimetres
    */
   int GetMonitorPhysicalWidth(int monitor);
   /**
    * Get specified monitor physical height in millimetres
    */
   int GetMonitorPhysicalHeight(int monitor);
   /**
    * Get specified monitor refresh rate
    */
   int GetMonitorRefreshRate(int monitor);
   /**
    * Get window position XY on monitor
    */
   Vector2 GetWindowPosition();
   /**
    * Get window scale DPI factor
    */
   Vector2 GetWindowScaleDPI();
   /**
    * Get the human-readable, UTF-8 encoded name of the primary monitor
    */
   const(char)* GetMonitorName(int monitor);
   /**
    * Set clipboard text content
    */
   void SetClipboardText(const(char)* text);
   /**
    * Get clipboard text content
    */
   const(char)* GetClipboardText();
   /**
    * Swap back buffer with front buffer (screen drawing)
    */
   void SwapScreenBuffer();
   /**
    * Register all input events
    */
   void PollInputEvents();
   /**
    * Wait for some milliseconds (halt program execution)
    */
   void WaitTime(float ms);
   /**
    * Shows cursor
    */
   void ShowCursor();
   /**
    * Hides cursor
    */
   void HideCursor();
   /**
    * Check if cursor is not visible
    */
   bool IsCursorHidden();
   /**
    * Enables cursor (unlock cursor)
    */
   void EnableCursor();
   /**
    * Disables cursor (lock cursor)
    */
   void DisableCursor();
   /**
    * Check if cursor is on the screen
    */
   bool IsCursorOnScreen();
   /**
    * Set background color (framebuffer clear color)
    */
   void ClearBackground(Color color);
   /**
    * Setup canvas (framebuffer) to start drawing
    */
   void BeginDrawing();
   /**
    * End canvas drawing and swap buffers (double buffering)
    */
   void EndDrawing();
   /**
    * Begin 2D mode with custom camera (2D)
    */
   void BeginMode2D(Camera2D camera);
   /**
    * Ends 2D mode with custom camera
    */
   void EndMode2D();
   /**
    * Begin 3D mode with custom camera (3D)
    */
   void BeginMode3D(Camera3D camera);
   /**
    * Ends 3D mode and returns to default 2D orthographic mode
    */
   void EndMode3D();
   /**
    * Begin drawing to render texture
    */
   void BeginTextureMode(RenderTexture2D target);
   /**
    * Ends drawing to render texture
    */
   void EndTextureMode();
   /**
    * Begin custom shader drawing
    */
   void BeginShaderMode(Shader shader);
   /**
    * End custom shader drawing (use default shader)
    */
   void EndShaderMode();
   /**
    * Begin blending mode (alpha, additive, multiplied, subtract, custom)
    */
   void BeginBlendMode(int mode);
   /**
    * End blending mode (reset to default: alpha blending)
    */
   void EndBlendMode();
   /**
    * Begin scissor mode (define screen area for following drawing)
    */
   void BeginScissorMode(int x, int y, int width, int height);
   /**
    * End scissor mode
    */
   void EndScissorMode();
   /**
    * Begin stereo rendering (requires VR simulator)
    */
   void BeginVrStereoMode(VrStereoConfig config);
   /**
    * End stereo rendering (requires VR simulator)
    */
   void EndVrStereoMode();
   /**
    * Load VR stereo config for VR simulator device parameters
    */
   VrStereoConfig LoadVrStereoConfig(VrDeviceInfo device);
   /**
    * Unload VR stereo config
    */
   void UnloadVrStereoConfig(VrStereoConfig config);
   /**
    * Load shader from files and bind default locations
    */
   Shader LoadShader(const(char)* vsFileName, const(char)* fsFileName);
   /**
    * Load shader from code strings and bind default locations
    */
   Shader LoadShaderFromMemory(const(char)* vsCode, const(char)* fsCode);
   /**
    * Get shader uniform location
    */
   int GetShaderLocation(Shader shader, const(char)* uniformName);
   /**
    * Get shader attribute location
    */
   int GetShaderLocationAttrib(Shader shader, const(char)* attribName);
   /**
    * Set shader uniform value
    */
   void SetShaderValue(Shader shader, int locIndex, const void* value, int uniformType);
   /**
    * Set shader uniform value vector
    */
   void SetShaderValueV(Shader shader, int locIndex, const void* value, int uniformType, int count);
   /**
    * Set shader uniform value (matrix 4x4)
    */
   void SetShaderValueMatrix(Shader shader, int locIndex, Matrix mat);
   /**
    * Set shader uniform value for texture (sampler2d)
    */
   void SetShaderValueTexture(Shader shader, int locIndex, Texture2D texture);
   /**
    * Unload shader from GPU memory (VRAM)
    */
   void UnloadShader(Shader shader);
   /**
    * Get a ray trace from mouse position
    */
   Ray GetMouseRay(Vector2 mousePosition, Camera camera);
   /**
    * Get camera transform matrix (view matrix)
    */
   Matrix GetCameraMatrix(Camera camera);
   /**
    * Get camera 2d transform matrix
    */
   Matrix GetCameraMatrix2D(Camera2D camera);
   /**
    * Get the screen space position for a 3d world space position
    */
   Vector2 GetWorldToScreen(Vector3 position, Camera camera);
   /**
    * Get size position for a 3d world space position
    */
   Vector2 GetWorldToScreenEx(Vector3 position, Camera camera, int width, int height);
   /**
    * Get the screen space position for a 2d camera world space position
    */
   Vector2 GetWorldToScreen2D(Vector2 position, Camera2D camera);
   /**
    * Get the world space position for a 2d camera screen space position
    */
   Vector2 GetScreenToWorld2D(Vector2 position, Camera2D camera);
   /**
    * Set target FPS (maximum)
    */
   void SetTargetFPS(int fps);
   /**
    * Get current FPS
    */
   int GetFPS();
   /**
    * Get time in seconds for last frame drawn (delta time)
    */
   float GetFrameTime();
   /**
    * Get elapsed time in seconds since InitWindow()
    */
   double GetTime();
   /**
    * Get a random value between min and max (both included)
    */
   int GetRandomValue(int min, int max);
   /**
    * Set the seed for the random number generator
    */
   void SetRandomSeed(uint seed);
   /**
    * Takes a screenshot of current screen (filename extension defines format)
    */
   void TakeScreenshot(const(char)* fileName);
   /**
    * Setup init configuration flags (view FLAGS)
    */
   void SetConfigFlags(uint flags);
   /**
    * Set the current threshold (minimum) log level
    */
   void SetTraceLogLevel(int logLevel);
   /**
    * Internal memory allocator
    */
   void* MemAlloc(int size);
   /**
    * Internal memory reallocator
    */
   void* MemRealloc(void* ptr, int size);
   /**
    * Internal memory free
    */
   void MemFree(void* ptr);
   /**
    * Load file data as byte array (read)
    */
   ubyte* LoadFileData(const(char)* fileName, uint* bytesRead);
   /**
    * Unload file data allocated by LoadFileData()
    */
   void UnloadFileData(ubyte* data);
   /**
    * Save data to file from byte array (write), returns true on success
    */
   bool SaveFileData(const(char)* fileName, void* data, uint bytesToWrite);
   /**
    * Load text data from file (read), returns a ' 0' terminated string
    */
   char* LoadFileText(const(char)* fileName);
   /**
    * Unload file text data allocated by LoadFileText()
    */
   void UnloadFileText(char* text);
   /**
    * Save text data to file (write), string must be ' 0' terminated, returns true on success
    */
   bool SaveFileText(const(char)* fileName, char* text);
   /**
    * Check if file exists
    */
   bool FileExists(const(char)* fileName);
   /**
    * Check if a directory path exists
    */
   bool DirectoryExists(const(char)* dirPath);
   /**
    * Check file extension (including point: .png, .wav)
    */
   bool IsFileExtension(const(char)* fileName, const(char)* ext);
   /**
    * Get pointer to extension for a filename string (includes dot: '.png')
    */
   const(char)* GetFileExtension(const(char)* fileName);
   /**
    * Get pointer to filename for a path string
    */
   const(char)* GetFileName(const(char)* filePath);
   /**
    * Get filename string without extension (uses static string)
    */
   const(char)* GetFileNameWithoutExt(const(char)* filePath);
   /**
    * Get full path for a given fileName with path (uses static string)
    */
   const(char)* GetDirectoryPath(const(char)* filePath);
   /**
    * Get previous directory path for a given path (uses static string)
    */
   const(char)* GetPrevDirectoryPath(const(char)* dirPath);
   /**
    * Get current working directory (uses static string)
    */
   const(char)* GetWorkingDirectory();
   /**
    * Get filenames in a directory path (memory should be freed)
    */
   char** GetDirectoryFiles(const(char)* dirPath, int* count);
   /**
    * Clear directory files paths buffers (free memory)
    */
   void ClearDirectoryFiles();
   /**
    * Change working directory, return true on success
    */
   bool ChangeDirectory(const(char)* dir);
   /**
    * Check if a file has been dropped into window
    */
   bool IsFileDropped();
   /**
    * Get dropped files names (memory should be freed)
    */
   char** GetDroppedFiles(int* count);
   /**
    * Clear dropped files paths buffer (free memory)
    */
   void ClearDroppedFiles();
   /**
    * Get file modification time (last write time)
    */
   long GetFileModTime(const(char)* fileName);
   /**
    * Compress data (DEFLATE algorithm)
    */
   ubyte* CompressData(ubyte* data, int dataLength, int* compDataLength);
   /**
    * Decompress data (DEFLATE algorithm)
    */
   ubyte* DecompressData(ubyte* compData, int compDataLength, int* dataLength);
   /**
    * Encode data to Base64 string
    */
   char* EncodeDataBase64(const(ubyte)* data, int dataLength, int* outputLength);
   /**
    * Decode Base64 string data
    */
   ubyte* DecodeDataBase64(ubyte* data, int* outputLength);
   /**
    * Save integer value to storage file (to defined position), returns true on success
    */
   bool SaveStorageValue(uint position, int value);
   /**
    * Load integer value from storage file (from defined position)
    */
   int LoadStorageValue(uint position);
   /**
    * Open URL with default system browser (if available)
    */
   void OpenURL(const(char)* url);
   /**
    * Check if a key has been pressed once
    */
   bool IsKeyPressed(int key);
   /**
    * Check if a key is being pressed
    */
   bool IsKeyDown(int key);
   /**
    * Check if a key has been released once
    */
   bool IsKeyReleased(int key);
   /**
    * Check if a key is NOT being pressed
    */
   bool IsKeyUp(int key);
   /**
    * Set a custom key to exit program (default is ESC)
    */
   void SetExitKey(int key);
   /**
    * Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
    */
   int GetKeyPressed();
   /**
    * Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
    */
   int GetCharPressed();
   /**
    * Check if a gamepad is available
    */
   bool IsGamepadAvailable(int gamepad);
   /**
    * Get gamepad internal name id
    */
   const(char)* GetGamepadName(int gamepad);
   /**
    * Check if a gamepad button has been pressed once
    */
   bool IsGamepadButtonPressed(int gamepad, int button);
   /**
    * Check if a gamepad button is being pressed
    */
   bool IsGamepadButtonDown(int gamepad, int button);
   /**
    * Check if a gamepad button has been released once
    */
   bool IsGamepadButtonReleased(int gamepad, int button);
   /**
    * Check if a gamepad button is NOT being pressed
    */
   bool IsGamepadButtonUp(int gamepad, int button);
   /**
    * Get the last gamepad button pressed
    */
   int GetGamepadButtonPressed();
   /**
    * Get gamepad axis count for a gamepad
    */
   int GetGamepadAxisCount(int gamepad);
   /**
    * Get axis movement value for a gamepad axis
    */
   float GetGamepadAxisMovement(int gamepad, int axis);
   /**
    * Set internal gamepad mappings (SDL_GameControllerDB)
    */
   int SetGamepadMappings(const(char)* mappings);
   /**
    * Check if a mouse button has been pressed once
    */
   bool IsMouseButtonPressed(int button);
   /**
    * Check if a mouse button is being pressed
    */
   bool IsMouseButtonDown(int button);
   /**
    * Check if a mouse button has been released once
    */
   bool IsMouseButtonReleased(int button);
   /**
    * Check if a mouse button is NOT being pressed
    */
   bool IsMouseButtonUp(int button);
   /**
    * Get mouse position X
    */
   int GetMouseX();
   /**
    * Get mouse position Y
    */
   int GetMouseY();
   /**
    * Get mouse position XY
    */
   Vector2 GetMousePosition();
   /**
    * Get mouse delta between frames
    */
   Vector2 GetMouseDelta();
   /**
    * Set mouse position XY
    */
   void SetMousePosition(int x, int y);
   /**
    * Set mouse offset
    */
   void SetMouseOffset(int offsetX, int offsetY);
   /**
    * Set mouse scaling
    */
   void SetMouseScale(float scaleX, float scaleY);
   /**
    * Get mouse wheel movement Y
    */
   float GetMouseWheelMove();
   /**
    * Set mouse cursor
    */
   void SetMouseCursor(int cursor);
   /**
    * Get touch position X for touch point 0 (relative to screen size)
    */
   int GetTouchX();
   /**
    * Get touch position Y for touch point 0 (relative to screen size)
    */
   int GetTouchY();
   /**
    * Get touch position XY for a touch point index (relative to screen size)
    */
   Vector2 GetTouchPosition(int index);
   /**
    * Get touch point identifier for given index
    */
   int GetTouchPointId(int index);
   /**
    * Get number of touch points
    */
   int GetTouchPointCount();
   /**
    * Enable a set of gestures using flags
    */
   void SetGesturesEnabled(uint flags);
   /**
    * Check if a gesture have been detected
    */
   bool IsGestureDetected(int gesture);
   /**
    * Get latest detected gesture
    */
   int GetGestureDetected();
   /**
    * Get gesture hold time in milliseconds
    */
   float GetGestureHoldDuration();
   /**
    * Get gesture drag vector
    */
   Vector2 GetGestureDragVector();
   /**
    * Get gesture drag angle
    */
   float GetGestureDragAngle();
   /**
    * Get gesture pinch delta
    */
   Vector2 GetGesturePinchVector();
   /**
    * Get gesture pinch angle
    */
   float GetGesturePinchAngle();
   /**
    * Set camera mode (multiple camera modes available)
    */
   void SetCameraMode(Camera camera, int mode);
   /**
    * Update camera position for selected mode
    */
   void UpdateCamera(Camera* camera);
   /**
    * Set camera pan key to combine with mouse movement (free camera)
    */
   void SetCameraPanControl(int keyPan);
   /**
    * Set camera alt key to combine with mouse movement (free camera)
    */
   void SetCameraAltControl(int keyAlt);
   /**
    * Set camera smooth zoom key to combine with mouse (free camera)
    */
   void SetCameraSmoothZoomControl(int keySmoothZoom);
   /**
    * Set camera move controls (1st person and 3rd person cameras)
    */
   void SetCameraMoveControls(int keyFront, int keyBack, int keyRight, int keyLeft, int keyUp, int keyDown);
   /**
    * Set texture and rectangle to be used on shapes drawing
    */
   void SetShapesTexture(Texture2D texture, Rectangle source);
   /**
    * Draw a pixel
    */
   void DrawPixel(int posX, int posY, Color color);
   /**
    * Draw a pixel (Vector version)
    */
   void DrawPixelV(Vector2 position, Color color);
   /**
    * Draw a line
    */
   void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
   /**
    * Draw a line (Vector version)
    */
   void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
   /**
    * Draw a line defining thickness
    */
   void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
   /**
    * Draw a line using cubic-bezier curves in-out
    */
   void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
   /**
    * Draw line using quadratic bezier curves with a control point
    */
   void DrawLineBezierQuad(Vector2 startPos, Vector2 endPos, Vector2 controlPos, float thick, Color color);
   /**
    * Draw line using cubic bezier curves with 2 control points
    */
   void DrawLineBezierCubic(Vector2 startPos, Vector2 endPos, Vector2 startControlPos, Vector2 endControlPos, float thick, Color color);
   /**
    * Draw lines sequence
    */
   void DrawLineStrip(Vector2* points, int pointCount, Color color);
   /**
    * Draw a color-filled circle
    */
   void DrawCircle(int centerX, int centerY, float radius, Color color);
   /**
    * Draw a piece of a circle
    */
   void DrawCircleSector(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
   /**
    * Draw circle sector outline
    */
   void DrawCircleSectorLines(Vector2 center, float radius, float startAngle, float endAngle, int segments, Color color);
   /**
    * Draw a gradient-filled circle
    */
   void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
   /**
    * Draw a color-filled circle (Vector version)
    */
   void DrawCircleV(Vector2 center, float radius, Color color);
   /**
    * Draw circle outline
    */
   void DrawCircleLines(int centerX, int centerY, float radius, Color color);
   /**
    * Draw ellipse
    */
   void DrawEllipse(int centerX, int centerY, float radiusH, float radiusV, Color color);
   /**
    * Draw ellipse outline
    */
   void DrawEllipseLines(int centerX, int centerY, float radiusH, float radiusV, Color color);
   /**
    * Draw ring
    */
   void DrawRing(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
   /**
    * Draw ring outline
    */
   void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, float startAngle, float endAngle, int segments, Color color);
   /**
    * Draw a color-filled rectangle
    */
   void DrawRectangle(int posX, int posY, int width, int height, Color color);
   /**
    * Draw a color-filled rectangle (Vector version)
    */
   void DrawRectangleV(Vector2 position, Vector2 size, Color color);
   /**
    * Draw a color-filled rectangle
    */
   void DrawRectangleRec(Rectangle rec, Color color);
   /**
    * Draw a color-filled rectangle with pro parameters
    */
   void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
   /**
    * Draw a vertical-gradient-filled rectangle
    */
   void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
   /**
    * Draw a horizontal-gradient-filled rectangle
    */
   void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
   /**
    * Draw a gradient-filled rectangle with custom vertex colors
    */
   void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
   /**
    * Draw rectangle outline
    */
   void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
   /**
    * Draw rectangle outline with extended parameters
    */
   void DrawRectangleLinesEx(Rectangle rec, float lineThick, Color color);
   /**
    * Draw rectangle with rounded edges
    */
   void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
   /**
    * Draw rectangle with rounded edges outline
    */
   void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, float lineThick, Color color);
   /**
    * Draw a color-filled triangle (vertex in counter-clockwise order!)
    */
   void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
   /**
    * Draw triangle outline (vertex in counter-clockwise order!)
    */
   void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
   /**
    * Draw a triangle fan defined by points (first vertex is the center)
    */
   void DrawTriangleFan(Vector2* points, int pointCount, Color color);
   /**
    * Draw a triangle strip defined by points
    */
   void DrawTriangleStrip(Vector2* points, int pointCount, Color color);
   /**
    * Draw a regular polygon (Vector version)
    */
   void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
   /**
    * Draw a polygon outline of n sides
    */
   void DrawPolyLines(Vector2 center, int sides, float radius, float rotation, Color color);
   /**
    * Draw a polygon outline of n sides with extended parameters
    */
   void DrawPolyLinesEx(Vector2 center, int sides, float radius, float rotation, float lineThick, Color color);
   /**
    * Check collision between two rectangles
    */
   bool CheckCollisionRecs(Rectangle rec1, Rectangle rec2);
   /**
    * Check collision between two circles
    */
   bool CheckCollisionCircles(Vector2 center1, float radius1, Vector2 center2, float radius2);
   /**
    * Check collision between circle and rectangle
    */
   bool CheckCollisionCircleRec(Vector2 center, float radius, Rectangle rec);
   /**
    * Check if point is inside rectangle
    */
   bool CheckCollisionPointRec(Vector2 point, Rectangle rec);
   /**
    * Check if point is inside circle
    */
   bool CheckCollisionPointCircle(Vector2 point, Vector2 center, float radius);
   /**
    * Check if point is inside a triangle
    */
   bool CheckCollisionPointTriangle(Vector2 point, Vector2 p1, Vector2 p2, Vector2 p3);
   /**
    * Check the collision between two lines defined by two points each, returns collision point by reference
    */
   bool CheckCollisionLines(Vector2 startPos1, Vector2 endPos1, Vector2 startPos2, Vector2 endPos2, Vector2* collisionPoint);
   /**
    * Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
    */
   bool CheckCollisionPointLine(Vector2 point, Vector2 p1, Vector2 p2, int threshold);
   /**
    * Get collision rectangle for two rectangles collision
    */
   Rectangle GetCollisionRec(Rectangle rec1, Rectangle rec2);
   /**
    * Load image from file into CPU memory (RAM)
    */
   Image LoadImage(const(char)* fileName);
   /**
    * Load image from RAW file data
    */
   Image LoadImageRaw(const(char)* fileName, int width, int height, int format, int headerSize);
   /**
    * Load image sequence from file (frames appended to image.data)
    */
   Image LoadImageAnim(const(char)* fileName, int* frames);
   /**
    * Load image from memory buffer, fileType refers to extension: i.e. '.png'
    */
   Image LoadImageFromMemory(const(char)* fileType, const(ubyte)* fileData, int dataSize);
   /**
    * Load image from GPU texture data
    */
   Image LoadImageFromTexture(Texture2D texture);
   /**
    * Load image from screen buffer and (screenshot)
    */
   Image LoadImageFromScreen();
   /**
    * Unload image from CPU memory (RAM)
    */
   void UnloadImage(Image image);
   /**
    * Export image data to file, returns true on success
    */
   bool ExportImage(Image image, const(char)* fileName);
   /**
    * Export image as code file defining an array of bytes, returns true on success
    */
   bool ExportImageAsCode(Image image, const(char)* fileName);
   /**
    * Generate image: plain color
    */
   Image GenImageColor(int width, int height, Color color);
   /**
    * Generate image: vertical gradient
    */
   Image GenImageGradientV(int width, int height, Color top, Color bottom);
   /**
    * Generate image: horizontal gradient
    */
   Image GenImageGradientH(int width, int height, Color left, Color right);
   /**
    * Generate image: radial gradient
    */
   Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
   /**
    * Generate image: checked
    */
   Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
   /**
    * Generate image: white noise
    */
   Image GenImageWhiteNoise(int width, int height, float factor);
   /**
    * Generate image: cellular algorithm, bigger tileSize means bigger cells
    */
   Image GenImageCellular(int width, int height, int tileSize);
   /**
    * Create an image duplicate (useful for transformations)
    */
   Image ImageCopy(Image image);
   /**
    * Create an image from another image piece
    */
   Image ImageFromImage(Image image, Rectangle rec);
   /**
    * Create an image from text (default font)
    */
   Image ImageText(const(char)* text, int fontSize, Color color);
   /**
    * Create an image from text (custom sprite font)
    */
   Image ImageTextEx(Font font, const(char)* text, float fontSize, float spacing, Color tint);
   /**
    * Convert image data to desired format
    */
   void ImageFormat(Image* image, int newFormat);
   /**
    * Convert image to POT (power-of-two)
    */
   void ImageToPOT(Image* image, Color fill);
   /**
    * Crop an image to a defined rectangle
    */
   void ImageCrop(Image* image, Rectangle crop);
   /**
    * Crop image depending on alpha value
    */
   void ImageAlphaCrop(Image* image, float threshold);
   /**
    * Clear alpha channel to desired color
    */
   void ImageAlphaClear(Image* image, Color color, float threshold);
   /**
    * Apply alpha mask to image
    */
   void ImageAlphaMask(Image* image, Image alphaMask);
   /**
    * Premultiply alpha channel
    */
   void ImageAlphaPremultiply(Image* image);
   /**
    * Resize image (Bicubic scaling algorithm)
    */
   void ImageResize(Image* image, int newWidth, int newHeight);
   /**
    * Resize image (Nearest-Neighbor scaling algorithm)
    */
   void ImageResizeNN(Image* image, int newWidth, int newHeight);
   /**
    * Resize canvas and fill with color
    */
   void ImageResizeCanvas(Image* image, int newWidth, int newHeight, int offsetX, int offsetY, Color fill);
   /**
    * Compute all mipmap levels for a provided image
    */
   void ImageMipmaps(Image* image);
   /**
    * Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
    */
   void ImageDither(Image* image, int rBpp, int gBpp, int bBpp, int aBpp);
   /**
    * Flip image vertically
    */
   void ImageFlipVertical(Image* image);
   /**
    * Flip image horizontally
    */
   void ImageFlipHorizontal(Image* image);
   /**
    * Rotate image clockwise 90deg
    */
   void ImageRotateCW(Image* image);
   /**
    * Rotate image counter-clockwise 90deg
    */
   void ImageRotateCCW(Image* image);
   /**
    * Modify image color: tint
    */
   void ImageColorTint(Image* image, Color color);
   /**
    * Modify image color: invert
    */
   void ImageColorInvert(Image* image);
   /**
    * Modify image color: grayscale
    */
   void ImageColorGrayscale(Image* image);
   /**
    * Modify image color: contrast (-100 to 100)
    */
   void ImageColorContrast(Image* image, float contrast);
   /**
    * Modify image color: brightness (-255 to 255)
    */
   void ImageColorBrightness(Image* image, int brightness);
   /**
    * Modify image color: replace color
    */
   void ImageColorReplace(Image* image, Color color, Color replace);
   /**
    * Load color data from image as a Color array (RGBA - 32bit)
    */
   Color* LoadImageColors(Image image);
   /**
    * Load colors palette from image as a Color array (RGBA - 32bit)
    */
   Color* LoadImagePalette(Image image, int maxPaletteSize, int* colorCount);
   /**
    * Unload color data loaded with LoadImageColors()
    */
   void UnloadImageColors(Color* colors);
   /**
    * Unload colors palette loaded with LoadImagePalette()
    */
   void UnloadImagePalette(Color* colors);
   /**
    * Get image alpha border rectangle
    */
   Rectangle GetImageAlphaBorder(Image image, float threshold);
   /**
    * Get image pixel color at (x, y) position
    */
   Color GetImageColor(Image image, int x, int y);
   /**
    * Clear image background with given color
    */
   void ImageClearBackground(Image* dst, Color color);
   /**
    * Draw pixel within an image
    */
   void ImageDrawPixel(Image* dst, int posX, int posY, Color color);
   /**
    * Draw pixel within an image (Vector version)
    */
   void ImageDrawPixelV(Image* dst, Vector2 position, Color color);
   /**
    * Draw line within an image
    */
   void ImageDrawLine(Image* dst, int startPosX, int startPosY, int endPosX, int endPosY, Color color);
   /**
    * Draw line within an image (Vector version)
    */
   void ImageDrawLineV(Image* dst, Vector2 start, Vector2 end, Color color);
   /**
    * Draw circle within an image
    */
   void ImageDrawCircle(Image* dst, int centerX, int centerY, int radius, Color color);
   /**
    * Draw circle within an image (Vector version)
    */
   void ImageDrawCircleV(Image* dst, Vector2 center, int radius, Color color);
   /**
    * Draw rectangle within an image
    */
   void ImageDrawRectangle(Image* dst, int posX, int posY, int width, int height, Color color);
   /**
    * Draw rectangle within an image (Vector version)
    */
   void ImageDrawRectangleV(Image* dst, Vector2 position, Vector2 size, Color color);
   /**
    * Draw rectangle within an image
    */
   void ImageDrawRectangleRec(Image* dst, Rectangle rec, Color color);
   /**
    * Draw rectangle lines within an image
    */
   void ImageDrawRectangleLines(Image* dst, Rectangle rec, int thick, Color color);
   /**
    * Draw a source image within a destination image (tint applied to source)
    */
   void ImageDraw(Image* dst, Image src, Rectangle srcRec, Rectangle dstRec, Color tint);
   /**
    * Draw text (using default font) within an image (destination)
    */
   void ImageDrawText(Image* dst, const(char)* text, int posX, int posY, int fontSize, Color color);
   /**
    * Draw text (custom sprite font) within an image (destination)
    */
   void ImageDrawTextEx(Image* dst, Font font, const(char)* text, Vector2 position, float fontSize, float spacing, Color tint);
   /**
    * Load texture from file into GPU memory (VRAM)
    */
   Texture2D LoadTexture(const(char)* fileName);
   /**
    * Load texture from image data
    */
   Texture2D LoadTextureFromImage(Image image);
   /**
    * Load cubemap from image, multiple image cubemap layouts supported
    */
   TextureCubemap LoadTextureCubemap(Image image, int layout);
   /**
    * Load texture for rendering (framebuffer)
    */
   RenderTexture2D LoadRenderTexture(int width, int height);
   /**
    * Unload texture from GPU memory (VRAM)
    */
   void UnloadTexture(Texture2D texture);
   /**
    * Unload render texture from GPU memory (VRAM)
    */
   void UnloadRenderTexture(RenderTexture2D target);
   /**
    * Update GPU texture with new data
    */
   void UpdateTexture(Texture2D texture, const void* pixels);
   /**
    * Update GPU texture rectangle with new data
    */
   void UpdateTextureRec(Texture2D texture, Rectangle rec, const void* pixels);
   /**
    * Generate GPU mipmaps for a texture
    */
   void GenTextureMipmaps(Texture2D* texture);
   /**
    * Set texture scaling filter mode
    */
   void SetTextureFilter(Texture2D texture, int filter);
   /**
    * Set texture wrapping mode
    */
   void SetTextureWrap(Texture2D texture, int wrap);
   /**
    * Draw a Texture2D
    */
   void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
   /**
    * Draw a Texture2D with position defined as Vector2
    */
   void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
   /**
    * Draw a Texture2D with extended parameters
    */
   void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
   /**
    * Draw a part of a texture defined by a rectangle
    */
   void DrawTextureRec(Texture2D texture, Rectangle source, Vector2 position, Color tint);
   /**
    * Draw texture quad with tiling and offset parameters
    */
   void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);
   /**
    * Draw part of a texture (defined by a rectangle) with rotation and scale tiled into dest.
    */
   void DrawTextureTiled(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, float scale, Color tint);
   /**
    * Draw a part of a texture defined by a rectangle with 'pro' parameters
    */
   void DrawTexturePro(Texture2D texture, Rectangle source, Rectangle dest, Vector2 origin, float rotation, Color tint);
   /**
    * Draws a texture (or part of it) that stretches or shrinks nicely
    */
   void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle dest, Vector2 origin, float rotation, Color tint);
   /**
    * Draw a textured polygon
    */
   void DrawTexturePoly(Texture2D texture, Vector2 center, Vector2* points, Vector2* texcoords, int pointCount, Color tint);
   /**
    * Get color with alpha applied, alpha goes from 0.0f to 1.0f
    */
   Color Fade(Color color, float alpha);
   /**
    * Get hexadecimal value for a Color
    */
   int ColorToInt(Color color);
   /**
    * Get Color normalized as float [0..1]
    */
   Vector4 ColorNormalize(Color color);
   /**
    * Get Color from normalized values [0..1]
    */
   Color ColorFromNormalized(Vector4 normalized);
   /**
    * Get HSV values for a Color, hue [0..360], saturation/value [0..1]
    */
   Vector3 ColorToHSV(Color color);
   /**
    * Get a Color from HSV values, hue [0..360], saturation/value [0..1]
    */
   Color ColorFromHSV(float hue, float saturation, float value);
   /**
    * Get color with alpha applied, alpha goes from 0.0f to 1.0f
    */
   Color ColorAlpha(Color color, float alpha);
   /**
    * Get src alpha-blended into dst color with tint
    */
   Color ColorAlphaBlend(Color dst, Color src, Color tint);
   /**
    * Get Color structure from hexadecimal value
    */
   Color GetColor(uint hexValue);
   /**
    * Get Color from a source pixel pointer of certain format
    */
   Color GetPixelColor(void* srcPtr, int format);
   /**
    * Set color formatted into destination pixel pointer
    */
   void SetPixelColor(void* dstPtr, Color color, int format);
   /**
    * Get pixel data size in bytes for certain format
    */
   int GetPixelDataSize(int width, int height, int format);
   /**
    * Get the default Font
    */
   Font GetFontDefault();
   /**
    * Load font from file into GPU memory (VRAM)
    */
   Font LoadFont(const(char)* fileName);
   /**
    * Load font from file with extended parameters
    */
   Font LoadFontEx(const(char)* fileName, int fontSize, int* fontChars, int glyphCount);
   /**
    * Load font from Image (XNA style)
    */
   Font LoadFontFromImage(Image image, Color key, int firstChar);
   /**
    * Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
    */
   Font LoadFontFromMemory(const(char)* fileType, const(ubyte)* fileData, int dataSize, int fontSize, int* fontChars, int glyphCount);
   /**
    * Load font data for further use
    */
   GlyphInfo* LoadFontData(const(ubyte)* fileData, int dataSize, int fontSize, int* fontChars, int glyphCount, int type);
   /**
    * Generate image font atlas using chars info
    */
   Image GenImageFontAtlas(const GlyphInfo* chars, Rectangle** recs, int glyphCount, int fontSize, int padding, int packMethod);
   /**
    * Unload font chars info data (RAM)
    */
   void UnloadFontData(GlyphInfo* chars, int glyphCount);
   /**
    * Unload Font from GPU memory (VRAM)
    */
   void UnloadFont(Font font);
   /**
    * Draw current FPS
    */
   void DrawFPS(int posX, int posY);
   /**
    * Draw text (using default font)
    */
   void DrawText(const(char)* text, int posX, int posY, int fontSize, Color color);
   /**
    * Draw text using font and additional parameters
    */
   void DrawTextEx(Font font, const(char)* text, Vector2 position, float fontSize, float spacing, Color tint);
   /**
    * Draw text using Font and pro parameters (rotation)
    */
   void DrawTextPro(Font font, const(char)* text, Vector2 position, Vector2 origin, float rotation, float fontSize, float spacing, Color tint);
   /**
    * Draw one character (codepoint)
    */
   void DrawTextCodepoint(Font font, int codepoint, Vector2 position, float fontSize, Color tint);
   /**
    * Measure string width for default font
    */
   int MeasureText(const(char)* text, int fontSize);
   /**
    * Measure string size for Font
    */
   Vector2 MeasureTextEx(Font font, const(char)* text, float fontSize, float spacing);
   /**
    * Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
    */
   int GetGlyphIndex(Font font, int codepoint);
   /**
    * Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
    */
   GlyphInfo GetGlyphInfo(Font font, int codepoint);
   /**
    * Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
    */
   Rectangle GetGlyphAtlasRec(Font font, int codepoint);
   /**
    * Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
    */
   int* LoadCodepoints(const(char)* text, int* count);
   /**
    * Unload codepoints data from memory
    */
   void UnloadCodepoints(int* codepoints);
   /**
    * Get total number of codepoints in a UTF-8 encoded string
    */
   int GetCodepointCount(const(char)* text);
   /**
    * Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
    */
   int GetCodepoint(const(char)* text, int* bytesProcessed);
   /**
    * Encode one codepoint into UTF-8 byte array (array length returned as parameter)
    */
   const(char)* CodepointToUTF8(int codepoint, int* byteSize);
   /**
    * Encode text as codepoints array into UTF-8 text string (WARNING: memory must be freed!)
    */
   char* TextCodepointsToUTF8(int* codepoints, int length);
   /**
    * Copy one string to another, returns bytes copied
    */
   int TextCopy(char* dst, const(char)* src);
   /**
    * Check if two text string are equal
    */
   bool TextIsEqual(const(char)* text1, const(char)* text2);
   /**
    * Get text length, checks for ' 0' ending
    */
   uint TextLength(const(char)* text);
   /**
    * Get a piece of a text string
    */
   const(char)* TextSubtext(const(char)* text, int position, int length);
   /**
    * Replace text string (WARNING: memory must be freed!)
    */
   char* TextReplace(char* text, const(char)* replace, const(char)* by);
   /**
    * Insert text in a position (WARNING: memory must be freed!)
    */
   char* TextInsert(const(char)* text, const(char)* insert, int position);
   /**
    * Join text strings with delimiter
    */
   const(char)* TextJoin(const char** textList, int count, const(char)* delimiter);
   /**
    * Split text into multiple strings
    */
   const char** TextSplit(const(char)* text, char delimiter, int* count);
   /**
    * Append text at specific position and move cursor!
    */
   void TextAppend(char* text, const(char)* append, int* position);
   /**
    * Find first text occurrence within a string
    */
   int TextFindIndex(const(char)* text, const(char)* find);
   /**
    * Get upper case version of provided string
    */
   const(char)* TextToUpper(const(char)* text);
   /**
    * Get lower case version of provided string
    */
   const(char)* TextToLower(const(char)* text);
   /**
    * Get Pascal case notation version of provided string
    */
   const(char)* TextToPascal(const(char)* text);
   /**
    * Get integer value from text (negative values not supported)
    */
   int TextToInteger(const(char)* text);
   /**
    * Draw a line in 3D world space
    */
   void DrawLine3D(Vector3 startPos, Vector3 endPos, Color color);
   /**
    * Draw a point in 3D space, actually a small line
    */
   void DrawPoint3D(Vector3 position, Color color);
   /**
    * Draw a circle in 3D world space
    */
   void DrawCircle3D(Vector3 center, float radius, Vector3 rotationAxis, float rotationAngle, Color color);
   /**
    * Draw a color-filled triangle (vertex in counter-clockwise order!)
    */
   void DrawTriangle3D(Vector3 v1, Vector3 v2, Vector3 v3, Color color);
   /**
    * Draw a triangle strip defined by points
    */
   void DrawTriangleStrip3D(Vector3* points, int pointCount, Color color);
   /**
    * Draw cube
    */
   void DrawCube(Vector3 position, float width, float height, float length, Color color);
   /**
    * Draw cube (Vector version)
    */
   void DrawCubeV(Vector3 position, Vector3 size, Color color);
   /**
    * Draw cube wires
    */
   void DrawCubeWires(Vector3 position, float width, float height, float length, Color color);
   /**
    * Draw cube wires (Vector version)
    */
   void DrawCubeWiresV(Vector3 position, Vector3 size, Color color);
   /**
    * Draw cube textured
    */
   void DrawCubeTexture(Texture2D texture, Vector3 position, float width, float height, float length, Color color);
   /**
    * Draw cube with a region of a texture
    */
   void DrawCubeTextureRec(Texture2D texture, Rectangle source, Vector3 position, float width, float height, float length, Color color);
   /**
    * Draw sphere
    */
   void DrawSphere(Vector3 centerPos, float radius, Color color);
   /**
    * Draw sphere with extended parameters
    */
   void DrawSphereEx(Vector3 centerPos, float radius, int rings, int slices, Color color);
   /**
    * Draw sphere wires
    */
   void DrawSphereWires(Vector3 centerPos, float radius, int rings, int slices, Color color);
   /**
    * Draw a cylinder/cone
    */
   void DrawCylinder(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
   /**
    * Draw a cylinder with base at startPos and top at endPos
    */
   void DrawCylinderEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color);
   /**
    * Draw a cylinder/cone wires
    */
   void DrawCylinderWires(Vector3 position, float radiusTop, float radiusBottom, float height, int slices, Color color);
   /**
    * Draw a cylinder wires with base at startPos and top at endPos
    */
   void DrawCylinderWiresEx(Vector3 startPos, Vector3 endPos, float startRadius, float endRadius, int sides, Color color);
   /**
    * Draw a plane XZ
    */
   void DrawPlane(Vector3 centerPos, Vector2 size, Color color);
   /**
    * Draw a ray line
    */
   void DrawRay(Ray ray, Color color);
   /**
    * Draw a grid (centered at (0, 0, 0))
    */
   void DrawGrid(int slices, float spacing);
   /**
    * Load model from files (meshes and materials)
    */
   Model LoadModel(const(char)* fileName);
   /**
    * Load model from generated mesh (default material)
    */
   Model LoadModelFromMesh(Mesh mesh);
   /**
    * Unload model (including meshes) from memory (RAM and/or VRAM)
    */
   void UnloadModel(Model model);
   /**
    * Unload model (but not meshes) from memory (RAM and/or VRAM)
    */
   void UnloadModelKeepMeshes(Model model);
   /**
    * Compute model bounding box limits (considers all meshes)
    */
   BoundingBox GetModelBoundingBox(Model model);
   /**
    * Draw a model (with texture if set)
    */
   void DrawModel(Model model, Vector3 position, float scale, Color tint);
   /**
    * Draw a model with extended parameters
    */
   void DrawModelEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
   /**
    * Draw a model wires (with texture if set)
    */
   void DrawModelWires(Model model, Vector3 position, float scale, Color tint);
   /**
    * Draw a model wires (with texture if set) with extended parameters
    */
   void DrawModelWiresEx(Model model, Vector3 position, Vector3 rotationAxis, float rotationAngle, Vector3 scale, Color tint);
   /**
    * Draw bounding box (wires)
    */
   void DrawBoundingBox(BoundingBox box, Color color);
   /**
    * Draw a billboard texture
    */
   void DrawBillboard(Camera camera, Texture2D texture, Vector3 position, float size, Color tint);
   /**
    * Draw a billboard texture defined by source
    */
   void DrawBillboardRec(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector2 size, Color tint);
   /**
    * Draw a billboard texture defined by source and rotation
    */
   void DrawBillboardPro(Camera camera, Texture2D texture, Rectangle source, Vector3 position, Vector3 up, Vector2 size, Vector2 origin, float rotation, Color tint);
   /**
    * Upload mesh vertex data in GPU and provide VAO/VBO ids
    */
   void UploadMesh(Mesh* mesh, bool dynamic);
   /**
    * Update mesh vertex data in GPU for a specific buffer index
    */
   void UpdateMeshBuffer(Mesh mesh, int index, void* data, int dataSize, int offset);
   /**
    * Unload mesh data from CPU and GPU
    */
   void UnloadMesh(Mesh mesh);
   /**
    * Draw a 3d mesh with material and transform
    */
   void DrawMesh(Mesh mesh, Material material, Matrix transform);
   /**
    * Draw multiple mesh instances with material and different transforms
    */
   void DrawMeshInstanced(Mesh mesh, Material material, Matrix* transforms, int instances);
   /**
    * Export mesh data to file, returns true on success
    */
   bool ExportMesh(Mesh mesh, const(char)* fileName);
   /**
    * Compute mesh bounding box limits
    */
   BoundingBox GetMeshBoundingBox(Mesh mesh);
   /**
    * Compute mesh tangents
    */
   void GenMeshTangents(Mesh* mesh);
   /**
    * Compute mesh binormals
    */
   void GenMeshBinormals(Mesh* mesh);
   /**
    * Generate polygonal mesh
    */
   Mesh GenMeshPoly(int sides, float radius);
   /**
    * Generate plane mesh (with subdivisions)
    */
   Mesh GenMeshPlane(float width, float length, int resX, int resZ);
   /**
    * Generate cuboid mesh
    */
   Mesh GenMeshCube(float width, float height, float length);
   /**
    * Generate sphere mesh (standard sphere)
    */
   Mesh GenMeshSphere(float radius, int rings, int slices);
   /**
    * Generate half-sphere mesh (no bottom cap)
    */
   Mesh GenMeshHemiSphere(float radius, int rings, int slices);
   /**
    * Generate cylinder mesh
    */
   Mesh GenMeshCylinder(float radius, float height, int slices);
   /**
    * Generate cone/pyramid mesh
    */
   Mesh GenMeshCone(float radius, float height, int slices);
   /**
    * Generate torus mesh
    */
   Mesh GenMeshTorus(float radius, float size, int radSeg, int sides);
   /**
    * Generate trefoil knot mesh
    */
   Mesh GenMeshKnot(float radius, float size, int radSeg, int sides);
   /**
    * Generate heightmap mesh from image data
    */
   Mesh GenMeshHeightmap(Image heightmap, Vector3 size);
   /**
    * Generate cubes-based map mesh from image data
    */
   Mesh GenMeshCubicmap(Image cubicmap, Vector3 cubeSize);
   /**
    * Load materials from model file
    */
   Material* LoadMaterials(const(char)* fileName, int* materialCount);
   /**
    * Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
    */
   Material LoadMaterialDefault();
   /**
    * Unload material from GPU memory (VRAM)
    */
   void UnloadMaterial(Material material);
   /**
    * Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
    */
   void SetMaterialTexture(Material* material, int mapType, Texture2D texture);
   /**
    * Set material for a mesh
    */
   void SetModelMeshMaterial(Model* model, int meshId, int materialId);
   /**
    * Load model animations from file
    */
   ModelAnimation* LoadModelAnimations(const(char)* fileName, uint* animCount);
   /**
    * Update model animation pose
    */
   void UpdateModelAnimation(Model model, ModelAnimation anim, int frame);
   /**
    * Unload animation data
    */
   void UnloadModelAnimation(ModelAnimation anim);
   /**
    * Unload animation array data
    */
   void UnloadModelAnimations(ModelAnimation* animations, uint count);
   /**
    * Check model animation skeleton match
    */
   bool IsModelAnimationValid(Model model, ModelAnimation anim);
   /**
    * Check collision between two spheres
    */
   bool CheckCollisionSpheres(Vector3 center1, float radius1, Vector3 center2, float radius2);
   /**
    * Check collision between two bounding boxes
    */
   bool CheckCollisionBoxes(BoundingBox box1, BoundingBox box2);
   /**
    * Check collision between box and sphere
    */
   bool CheckCollisionBoxSphere(BoundingBox box, Vector3 center, float radius);
   /**
    * Get collision info between ray and sphere
    */
   RayCollision GetRayCollisionSphere(Ray ray, Vector3 center, float radius);
   /**
    * Get collision info between ray and box
    */
   RayCollision GetRayCollisionBox(Ray ray, BoundingBox box);
   /**
    * Get collision info between ray and model
    */
   RayCollision GetRayCollisionModel(Ray ray, Model model);
   /**
    * Get collision info between ray and mesh
    */
   RayCollision GetRayCollisionMesh(Ray ray, Mesh mesh, Matrix transform);
   /**
    * Get collision info between ray and triangle
    */
   RayCollision GetRayCollisionTriangle(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3);
   /**
    * Get collision info between ray and quad
    */
   RayCollision GetRayCollisionQuad(Ray ray, Vector3 p1, Vector3 p2, Vector3 p3, Vector3 p4);
   /**
    * Initialize audio device and context
    */
   void InitAudioDevice();
   /**
    * Close the audio device and context
    */
   void CloseAudioDevice();
   /**
    * Check if audio device has been initialized successfully
    */
   bool IsAudioDeviceReady();
   /**
    * Set master volume (listener)
    */
   void SetMasterVolume(float volume);
   /**
    * Load wave data from file
    */
   Wave LoadWave(const(char)* fileName);
   /**
    * Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
    */
   Wave LoadWaveFromMemory(const(char)* fileType, const(ubyte)* fileData, int dataSize);
   /**
    * Load sound from file
    */
   Sound LoadSound(const(char)* fileName);
   /**
    * Load sound from wave data
    */
   Sound LoadSoundFromWave(Wave wave);
   /**
    * Update sound buffer with new data
    */
   void UpdateSound(Sound sound, const void* data, int sampleCount);
   /**
    * Unload wave data
    */
   void UnloadWave(Wave wave);
   /**
    * Unload sound
    */
   void UnloadSound(Sound sound);
   /**
    * Export wave data to file, returns true on success
    */
   bool ExportWave(Wave wave, const(char)* fileName);
   /**
    * Export wave sample data to code (.h), returns true on success
    */
   bool ExportWaveAsCode(Wave wave, const(char)* fileName);
   /**
    * Play a sound
    */
   void PlaySound(Sound sound);
   /**
    * Stop playing a sound
    */
   void StopSound(Sound sound);
   /**
    * Pause a sound
    */
   void PauseSound(Sound sound);
   /**
    * Resume a paused sound
    */
   void ResumeSound(Sound sound);
   /**
    * Play a sound (using multichannel buffer pool)
    */
   void PlaySoundMulti(Sound sound);
   /**
    * Stop any sound playing (using multichannel buffer pool)
    */
   void StopSoundMulti();
   /**
    * Get number of sounds playing in the multichannel
    */
   int GetSoundsPlaying();
   /**
    * Check if a sound is currently playing
    */
   bool IsSoundPlaying(Sound sound);
   /**
    * Set volume for a sound (1.0 is max level)
    */
   void SetSoundVolume(Sound sound, float volume);
   /**
    * Set pitch for a sound (1.0 is base level)
    */
   void SetSoundPitch(Sound sound, float pitch);
   /**
    * Convert wave data to desired format
    */
   void WaveFormat(Wave* wave, int sampleRate, int sampleSize, int channels);
   /**
    * Copy a wave to a new wave
    */
   Wave WaveCopy(Wave wave);
   /**
    * Crop a wave to defined samples range
    */
   void WaveCrop(Wave* wave, int initSample, int finalSample);
   /**
    * Load samples data from wave as a floats array
    */
   float* LoadWaveSamples(Wave wave);
   /**
    * Unload samples data loaded with LoadWaveSamples()
    */
   void UnloadWaveSamples(float* samples);
   /**
    * Load music stream from file
    */
   Music LoadMusicStream(const(char)* fileName);
   /**
    * Load music stream from data
    */
   Music LoadMusicStreamFromMemory(const(char)* fileType, ubyte* data, int dataSize);
   /**
    * Unload music stream
    */
   void UnloadMusicStream(Music music);
   /**
    * Start music playing
    */
   void PlayMusicStream(Music music);
   /**
    * Check if music is playing
    */
   bool IsMusicStreamPlaying(Music music);
   /**
    * Updates buffers for music streaming
    */
   void UpdateMusicStream(Music music);
   /**
    * Stop music playing
    */
   void StopMusicStream(Music music);
   /**
    * Pause music playing
    */
   void PauseMusicStream(Music music);
   /**
    * Resume playing paused music
    */
   void ResumeMusicStream(Music music);
   /**
    * Seek music to a position (in seconds)
    */
   void SeekMusicStream(Music music, float position);
   /**
    * Set volume for music (1.0 is max level)
    */
   void SetMusicVolume(Music music, float volume);
   /**
    * Set pitch for a music (1.0 is base level)
    */
   void SetMusicPitch(Music music, float pitch);
   /**
    * Get music time length (in seconds)
    */
   float GetMusicTimeLength(Music music);
   /**
    * Get current music time played (in seconds)
    */
   float GetMusicTimePlayed(Music music);
   /**
    * Load audio stream (to stream raw audio pcm data)
    */
   AudioStream LoadAudioStream(uint sampleRate, uint sampleSize, uint channels);
   /**
    * Unload audio stream and free memory
    */
   void UnloadAudioStream(AudioStream stream);
   /**
    * Update audio stream buffers with data
    */
   void UpdateAudioStream(AudioStream stream, const void* data, int frameCount);
   /**
    * Check if any audio stream buffers requires refill
    */
   bool IsAudioStreamProcessed(AudioStream stream);
   /**
    * Play audio stream
    */
   void PlayAudioStream(AudioStream stream);
   /**
    * Pause audio stream
    */
   void PauseAudioStream(AudioStream stream);
   /**
    * Resume audio stream
    */
   void ResumeAudioStream(AudioStream stream);
   /**
    * Check if audio stream is playing
    */
   bool IsAudioStreamPlaying(AudioStream stream);
   /**
    * Stop audio stream
    */
   void StopAudioStream(AudioStream stream);
   /**
    * Set volume for audio stream (1.0 is max level)
    */
   void SetAudioStreamVolume(AudioStream stream, float volume);
   /**
    * Set pitch for audio stream (1.0 is base level)
    */
   void SetAudioStreamPitch(AudioStream stream, float pitch);
   /**
    * Default size for new audio streams
    */
   void SetAudioStreamBufferSizeDefault(int size);
}

