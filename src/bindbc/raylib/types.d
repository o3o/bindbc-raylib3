/**
 * Raylib types
 *
 * Automatically generated, do not modify
 */
module bindbc.raylib.types;

enum RaylibSupport {
   noLibrary,
   badLibrary,
   raylib370 = 370,
   raylib400 = 400
}

enum RAYLIB_VERSION_MAJOR = 4;
enum RAYLIB_VERSION_MINOR = 0;
enum RAYLIB_VERSION_REVISION = 0;
enum RAYLIB_VERSION_BUILD = 0;
enum raylibSupport = RaylibSupport.raylib400;


// structs

struct Vector2 {
   /// Vector x component
   float x;
   /// Vector y component
   float y;
}
struct Vector3 {
   /// Vector x component
   float x;
   /// Vector y component
   float y;
   /// Vector z component
   float z;
}
struct Vector4 {
   /// Vector x component
   float x;
   /// Vector y component
   float y;
   /// Vector z component
   float z;
   /// Vector w component
   float w;
}
struct Matrix {
   /// Matrix first row (4 components)
   float m0, m4, m8, m12;
   /// Matrix second row (4 components)
   float m1, m5, m9, m13;
   /// Matrix third row (4 components)
   float m2, m6, m10, m14;
   /// Matrix fourth row (4 components)
   float m3, m7, m11, m15;
}
struct Color {
   /// Color red value
   ubyte r;
   /// Color green value
   ubyte g;
   /// Color blue value
   ubyte b;
   /// Color alpha value
   ubyte a;
}
struct Rectangle {
   /// Rectangle top-left corner position x
   float x;
   /// Rectangle top-left corner position y
   float y;
   /// Rectangle width
   float width;
   /// Rectangle height
   float height;
}
struct Image {
   /// Image raw data
   void* data;
   /// Image base width
   int width;
   /// Image base height
   int height;
   /// Mipmap levels, 1 by default
   int mipmaps;
   /// Data format (PixelFormat type)
   int format;
}
struct Texture {
   /// OpenGL texture id
   uint id;
   /// Texture base width
   int width;
   /// Texture base height
   int height;
   /// Mipmap levels, 1 by default
   int mipmaps;
   /// Data format (PixelFormat type)
   int format;
}
struct RenderTexture {
   /// OpenGL framebuffer object id
   uint id;
   /// Color buffer attachment texture
   Texture texture;
   /// Depth buffer attachment texture
   Texture depth;
}
struct NPatchInfo {
   /// Texture source rectangle
   Rectangle source;
   /// Left border offset
   int left;
   /// Top border offset
   int top;
   /// Right border offset
   int right;
   /// Bottom border offset
   int bottom;
   /// Layout of the n-patch: 3x3, 1x3 or 3x1
   int layout;
}
struct GlyphInfo {
   /// Character value (Unicode)
   int value;
   /// Character offset X when drawing
   int offsetX;
   /// Character offset Y when drawing
   int offsetY;
   /// Character advance position X
   int advanceX;
   /// Character image data
   Image image;
}
struct Font {
   /// Base size (default chars height)
   int baseSize;
   /// Number of glyph characters
   int glyphCount;
   /// Padding around the glyph characters
   int glyphPadding;
   /// Texture atlas containing the glyphs
   Texture2D texture;
   /// Rectangles in texture for the glyphs
   Rectangle* recs;
   /// Glyphs info data
   GlyphInfo* glyphs;
}
struct Camera3D {
   /// Camera position
   Vector3 position;
   /// Camera target it looks-at
   Vector3 target;
   /// Camera up vector (rotation over its axis)
   Vector3 up;
   /// Camera field-of-view apperture in Y (degrees) in perspective, used as near plane width in orthographic
   float fovy;
   /// Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC
   int projection;
}
struct Camera2D {
   /// Camera offset (displacement from target)
   Vector2 offset;
   /// Camera target (rotation and zoom origin)
   Vector2 target;
   /// Camera rotation in degrees
   float rotation;
   /// Camera zoom (scaling), should be 1.0f by default
   float zoom;
}
struct Mesh {
   /// Number of vertices stored in arrays
   int vertexCount;
   /// Number of triangles stored (indexed or not)
   int triangleCount;
   /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
   float* vertices;
   /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
   float* texcoords;
   /// Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
   float* texcoords2;
   /// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
   float* normals;
   /// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
   float* tangents;
   /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
   ubyte* colors;
   /// Vertex indices (in case vertex data comes indexed)
   ushort* indices;
   /// Animated vertex positions (after bones transformations)
   float* animVertices;
   /// Animated normals (after bones transformations)
   float* animNormals;
   /// Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
   ubyte* boneIds;
   /// Vertex bone weight, up to 4 bones influence by vertex (skinning)
   float* boneWeights;
   /// OpenGL Vertex Array Object id
   uint vaoId;
   /// OpenGL Vertex Buffer Objects id (default vertex data)
   uint* vboId;
}
struct Shader {
   /// Shader program id
   uint id;
   /// Shader locations array (RL_MAX_SHADER_LOCATIONS)
   int* locs;
}
struct MaterialMap {
   /// Material map texture
   Texture2D texture;
   /// Material map color
   Color color;
   /// Material map value
   float value;
}
struct Material {
   /// Material shader
   Shader shader;
   /// Material maps array (MAX_MATERIAL_MAPS)
   MaterialMap* maps;
   /// Material generic parameters (if required)
   float[4] params;
}
struct Transform {
   /// Translation
   Vector3 translation;
   /// Rotation
   Quaternion rotation;
   /// Scale
   Vector3 scale;
}
struct BoneInfo {
   /// Bone name
   char[32] name;
   /// Bone parent
   int parent;
}
struct Model {
   /// Local transform matrix
   Matrix transform;
   /// Number of meshes
   int meshCount;
   /// Number of materials
   int materialCount;
   /// Meshes array
   Mesh* meshes;
   /// Materials array
   Material* materials;
   /// Mesh material number
   int* meshMaterial;
   /// Number of bones
   int boneCount;
   /// Bones information (skeleton)
   BoneInfo* bones;
   /// Bones base transformation (pose)
   Transform* bindPose;
}
struct ModelAnimation {
   /// Number of bones
   int boneCount;
   /// Number of animation frames
   int frameCount;
   /// Bones information (skeleton)
   BoneInfo* bones;
   /// Poses array by frame
   Transform** framePoses;
}
struct Ray {
   /// Ray position (origin)
   Vector3 position;
   /// Ray direction
   Vector3 direction;
}
struct RayCollision {
   /// Did the ray hit something?
   bool hit;
   /// Distance to nearest hit
   float distance;
   /// Point of nearest hit
   Vector3 point;
   /// Surface normal of hit
   Vector3 normal;
}
struct BoundingBox {
   /// Minimum vertex box-corner
   Vector3 min;
   /// Maximum vertex box-corner
   Vector3 max;
}
struct Wave {
   /// Total number of frames (considering channels)
   uint frameCount;
   /// Frequency (samples per second)
   uint sampleRate;
   /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
   uint sampleSize;
   /// Number of channels (1-mono, 2-stereo, ...)
   uint channels;
   /// Buffer data pointer
   void* data;
}
struct AudioStream {
   /// Pointer to internal data used by the audio system
   rAudioBuffer* buffer;
   /// Frequency (samples per second)
   uint sampleRate;
   /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
   uint sampleSize;
   /// Number of channels (1-mono, 2-stereo, ...)
   uint channels;
}
struct Sound {
   /// Audio stream
   AudioStream stream;
   /// Total number of frames (considering channels)
   uint frameCount;
}
struct Music {
   /// Audio stream
   AudioStream stream;
   /// Total number of frames (considering channels)
   uint frameCount;
   /// Music looping enable
   bool looping;
   /// Type of music context (audio filetype)
   int ctxType;
   /// Audio context data, depends on type
   void* ctxData;
}
struct VrDeviceInfo {
   /// Horizontal resolution in pixels
   int hResolution;
   /// Vertical resolution in pixels
   int vResolution;
   /// Horizontal size in meters
   float hScreenSize;
   /// Vertical size in meters
   float vScreenSize;
   /// Screen center in meters
   float vScreenCenter;
   /// Distance between eye and display in meters
   float eyeToScreenDistance;
   /// Lens separation distance in meters
   float lensSeparationDistance;
   /// IPD (distance between pupils) in meters
   float interpupillaryDistance;
   /// Lens distortion constant parameters
   float[4] lensDistortionValues;
   /// Chromatic aberration correction parameters
   float[4] chromaAbCorrection;
}
struct VrStereoConfig {
   /// VR projection matrices (per eye)
   Matrix[2] projection;
   /// VR view offset matrices (per eye)
   Matrix[2] viewOffset;
   /// VR left lens center
   float[2] leftLensCenter;
   /// VR right lens center
   float[2] rightLensCenter;
   /// VR left screen center
   float[2] leftScreenCenter;
   /// VR right screen center
   float[2] rightScreenCenter;
   /// VR distortion scale
   float[2] scale;
   /// VR distortion scale in
   float[2] scaleIn;
}

alias RenderTexture2D = RenderTexture;
alias Camera = Camera3D;
alias Texture2D = Texture;
alias TextureCubemap = Texture;
alias Quaternion = Vector4;
struct rAudioBuffer {}

// enums

enum ConfigFlags {
   FLAG_VSYNC_HINT = 64,
   FLAG_FULLSCREEN_MODE = 2,
   FLAG_WINDOW_RESIZABLE = 4,
   FLAG_WINDOW_UNDECORATED = 8,
   FLAG_WINDOW_HIDDEN = 128,
   FLAG_WINDOW_MINIMIZED = 512,
   FLAG_WINDOW_MAXIMIZED = 1024,
   FLAG_WINDOW_UNFOCUSED = 2048,
   FLAG_WINDOW_TOPMOST = 4096,
   FLAG_WINDOW_ALWAYS_RUN = 256,
   FLAG_WINDOW_TRANSPARENT = 16,
   FLAG_WINDOW_HIGHDPI = 8192,
   FLAG_MSAA_4X_HINT = 32,
   FLAG_INTERLACED_HINT = 65536,
}

alias FLAG_VSYNC_HINT = ConfigFlags.FLAG_VSYNC_HINT;
alias FLAG_FULLSCREEN_MODE = ConfigFlags.FLAG_FULLSCREEN_MODE;
alias FLAG_WINDOW_RESIZABLE = ConfigFlags.FLAG_WINDOW_RESIZABLE;
alias FLAG_WINDOW_UNDECORATED = ConfigFlags.FLAG_WINDOW_UNDECORATED;
alias FLAG_WINDOW_HIDDEN = ConfigFlags.FLAG_WINDOW_HIDDEN;
alias FLAG_WINDOW_MINIMIZED = ConfigFlags.FLAG_WINDOW_MINIMIZED;
alias FLAG_WINDOW_MAXIMIZED = ConfigFlags.FLAG_WINDOW_MAXIMIZED;
alias FLAG_WINDOW_UNFOCUSED = ConfigFlags.FLAG_WINDOW_UNFOCUSED;
alias FLAG_WINDOW_TOPMOST = ConfigFlags.FLAG_WINDOW_TOPMOST;
alias FLAG_WINDOW_ALWAYS_RUN = ConfigFlags.FLAG_WINDOW_ALWAYS_RUN;
alias FLAG_WINDOW_TRANSPARENT = ConfigFlags.FLAG_WINDOW_TRANSPARENT;
alias FLAG_WINDOW_HIGHDPI = ConfigFlags.FLAG_WINDOW_HIGHDPI;
alias FLAG_MSAA_4X_HINT = ConfigFlags.FLAG_MSAA_4X_HINT;
alias FLAG_INTERLACED_HINT = ConfigFlags.FLAG_INTERLACED_HINT;
enum TraceLogLevel {
   LOG_ALL = 0,
   LOG_TRACE = 1,
   LOG_DEBUG = 2,
   LOG_INFO = 3,
   LOG_WARNING = 4,
   LOG_ERROR = 5,
   LOG_FATAL = 6,
   LOG_NONE = 7,
}

alias LOG_ALL = TraceLogLevel.LOG_ALL;
alias LOG_TRACE = TraceLogLevel.LOG_TRACE;
alias LOG_DEBUG = TraceLogLevel.LOG_DEBUG;
alias LOG_INFO = TraceLogLevel.LOG_INFO;
alias LOG_WARNING = TraceLogLevel.LOG_WARNING;
alias LOG_ERROR = TraceLogLevel.LOG_ERROR;
alias LOG_FATAL = TraceLogLevel.LOG_FATAL;
alias LOG_NONE = TraceLogLevel.LOG_NONE;
enum KeyboardKey {
   KEY_NULL = 0,
   KEY_APOSTROPHE = 39,
   KEY_COMMA = 44,
   KEY_MINUS = 45,
   KEY_PERIOD = 46,
   KEY_SLASH = 47,
   KEY_ZERO = 48,
   KEY_ONE = 49,
   KEY_TWO = 50,
   KEY_THREE = 51,
   KEY_FOUR = 52,
   KEY_FIVE = 53,
   KEY_SIX = 54,
   KEY_SEVEN = 55,
   KEY_EIGHT = 56,
   KEY_NINE = 57,
   KEY_SEMICOLON = 59,
   KEY_EQUAL = 61,
   KEY_A = 65,
   KEY_B = 66,
   KEY_C = 67,
   KEY_D = 68,
   KEY_E = 69,
   KEY_F = 70,
   KEY_G = 71,
   KEY_H = 72,
   KEY_I = 73,
   KEY_J = 74,
   KEY_K = 75,
   KEY_L = 76,
   KEY_M = 77,
   KEY_N = 78,
   KEY_O = 79,
   KEY_P = 80,
   KEY_Q = 81,
   KEY_R = 82,
   KEY_S = 83,
   KEY_T = 84,
   KEY_U = 85,
   KEY_V = 86,
   KEY_W = 87,
   KEY_X = 88,
   KEY_Y = 89,
   KEY_Z = 90,
   KEY_LEFT_BRACKET = 91,
   KEY_BACKSLASH = 92,
   KEY_RIGHT_BRACKET = 93,
   KEY_GRAVE = 96,
   KEY_SPACE = 32,
   KEY_ESCAPE = 256,
   KEY_ENTER = 257,
   KEY_TAB = 258,
   KEY_BACKSPACE = 259,
   KEY_INSERT = 260,
   KEY_DELETE = 261,
   KEY_RIGHT = 262,
   KEY_LEFT = 263,
   KEY_DOWN = 264,
   KEY_UP = 265,
   KEY_PAGE_UP = 266,
   KEY_PAGE_DOWN = 267,
   KEY_HOME = 268,
   KEY_END = 269,
   KEY_CAPS_LOCK = 280,
   KEY_SCROLL_LOCK = 281,
   KEY_NUM_LOCK = 282,
   KEY_PRINT_SCREEN = 283,
   KEY_PAUSE = 284,
   KEY_F1 = 290,
   KEY_F2 = 291,
   KEY_F3 = 292,
   KEY_F4 = 293,
   KEY_F5 = 294,
   KEY_F6 = 295,
   KEY_F7 = 296,
   KEY_F8 = 297,
   KEY_F9 = 298,
   KEY_F10 = 299,
   KEY_F11 = 300,
   KEY_F12 = 301,
   KEY_LEFT_SHIFT = 340,
   KEY_LEFT_CONTROL = 341,
   KEY_LEFT_ALT = 342,
   KEY_LEFT_SUPER = 343,
   KEY_RIGHT_SHIFT = 344,
   KEY_RIGHT_CONTROL = 345,
   KEY_RIGHT_ALT = 346,
   KEY_RIGHT_SUPER = 347,
   KEY_KB_MENU = 348,
   KEY_KP_0 = 320,
   KEY_KP_1 = 321,
   KEY_KP_2 = 322,
   KEY_KP_3 = 323,
   KEY_KP_4 = 324,
   KEY_KP_5 = 325,
   KEY_KP_6 = 326,
   KEY_KP_7 = 327,
   KEY_KP_8 = 328,
   KEY_KP_9 = 329,
   KEY_KP_DECIMAL = 330,
   KEY_KP_DIVIDE = 331,
   KEY_KP_MULTIPLY = 332,
   KEY_KP_SUBTRACT = 333,
   KEY_KP_ADD = 334,
   KEY_KP_ENTER = 335,
   KEY_KP_EQUAL = 336,
   KEY_BACK = 4,
   KEY_MENU = 82,
   KEY_VOLUME_UP = 24,
   KEY_VOLUME_DOWN = 25,
}

alias KEY_NULL = KeyboardKey.KEY_NULL;
alias KEY_APOSTROPHE = KeyboardKey.KEY_APOSTROPHE;
alias KEY_COMMA = KeyboardKey.KEY_COMMA;
alias KEY_MINUS = KeyboardKey.KEY_MINUS;
alias KEY_PERIOD = KeyboardKey.KEY_PERIOD;
alias KEY_SLASH = KeyboardKey.KEY_SLASH;
alias KEY_ZERO = KeyboardKey.KEY_ZERO;
alias KEY_ONE = KeyboardKey.KEY_ONE;
alias KEY_TWO = KeyboardKey.KEY_TWO;
alias KEY_THREE = KeyboardKey.KEY_THREE;
alias KEY_FOUR = KeyboardKey.KEY_FOUR;
alias KEY_FIVE = KeyboardKey.KEY_FIVE;
alias KEY_SIX = KeyboardKey.KEY_SIX;
alias KEY_SEVEN = KeyboardKey.KEY_SEVEN;
alias KEY_EIGHT = KeyboardKey.KEY_EIGHT;
alias KEY_NINE = KeyboardKey.KEY_NINE;
alias KEY_SEMICOLON = KeyboardKey.KEY_SEMICOLON;
alias KEY_EQUAL = KeyboardKey.KEY_EQUAL;
alias KEY_A = KeyboardKey.KEY_A;
alias KEY_B = KeyboardKey.KEY_B;
alias KEY_C = KeyboardKey.KEY_C;
alias KEY_D = KeyboardKey.KEY_D;
alias KEY_E = KeyboardKey.KEY_E;
alias KEY_F = KeyboardKey.KEY_F;
alias KEY_G = KeyboardKey.KEY_G;
alias KEY_H = KeyboardKey.KEY_H;
alias KEY_I = KeyboardKey.KEY_I;
alias KEY_J = KeyboardKey.KEY_J;
alias KEY_K = KeyboardKey.KEY_K;
alias KEY_L = KeyboardKey.KEY_L;
alias KEY_M = KeyboardKey.KEY_M;
alias KEY_N = KeyboardKey.KEY_N;
alias KEY_O = KeyboardKey.KEY_O;
alias KEY_P = KeyboardKey.KEY_P;
alias KEY_Q = KeyboardKey.KEY_Q;
alias KEY_R = KeyboardKey.KEY_R;
alias KEY_S = KeyboardKey.KEY_S;
alias KEY_T = KeyboardKey.KEY_T;
alias KEY_U = KeyboardKey.KEY_U;
alias KEY_V = KeyboardKey.KEY_V;
alias KEY_W = KeyboardKey.KEY_W;
alias KEY_X = KeyboardKey.KEY_X;
alias KEY_Y = KeyboardKey.KEY_Y;
alias KEY_Z = KeyboardKey.KEY_Z;
alias KEY_LEFT_BRACKET = KeyboardKey.KEY_LEFT_BRACKET;
alias KEY_BACKSLASH = KeyboardKey.KEY_BACKSLASH;
alias KEY_RIGHT_BRACKET = KeyboardKey.KEY_RIGHT_BRACKET;
alias KEY_GRAVE = KeyboardKey.KEY_GRAVE;
alias KEY_SPACE = KeyboardKey.KEY_SPACE;
alias KEY_ESCAPE = KeyboardKey.KEY_ESCAPE;
alias KEY_ENTER = KeyboardKey.KEY_ENTER;
alias KEY_TAB = KeyboardKey.KEY_TAB;
alias KEY_BACKSPACE = KeyboardKey.KEY_BACKSPACE;
alias KEY_INSERT = KeyboardKey.KEY_INSERT;
alias KEY_DELETE = KeyboardKey.KEY_DELETE;
alias KEY_RIGHT = KeyboardKey.KEY_RIGHT;
alias KEY_LEFT = KeyboardKey.KEY_LEFT;
alias KEY_DOWN = KeyboardKey.KEY_DOWN;
alias KEY_UP = KeyboardKey.KEY_UP;
alias KEY_PAGE_UP = KeyboardKey.KEY_PAGE_UP;
alias KEY_PAGE_DOWN = KeyboardKey.KEY_PAGE_DOWN;
alias KEY_HOME = KeyboardKey.KEY_HOME;
alias KEY_END = KeyboardKey.KEY_END;
alias KEY_CAPS_LOCK = KeyboardKey.KEY_CAPS_LOCK;
alias KEY_SCROLL_LOCK = KeyboardKey.KEY_SCROLL_LOCK;
alias KEY_NUM_LOCK = KeyboardKey.KEY_NUM_LOCK;
alias KEY_PRINT_SCREEN = KeyboardKey.KEY_PRINT_SCREEN;
alias KEY_PAUSE = KeyboardKey.KEY_PAUSE;
alias KEY_F1 = KeyboardKey.KEY_F1;
alias KEY_F2 = KeyboardKey.KEY_F2;
alias KEY_F3 = KeyboardKey.KEY_F3;
alias KEY_F4 = KeyboardKey.KEY_F4;
alias KEY_F5 = KeyboardKey.KEY_F5;
alias KEY_F6 = KeyboardKey.KEY_F6;
alias KEY_F7 = KeyboardKey.KEY_F7;
alias KEY_F8 = KeyboardKey.KEY_F8;
alias KEY_F9 = KeyboardKey.KEY_F9;
alias KEY_F10 = KeyboardKey.KEY_F10;
alias KEY_F11 = KeyboardKey.KEY_F11;
alias KEY_F12 = KeyboardKey.KEY_F12;
alias KEY_LEFT_SHIFT = KeyboardKey.KEY_LEFT_SHIFT;
alias KEY_LEFT_CONTROL = KeyboardKey.KEY_LEFT_CONTROL;
alias KEY_LEFT_ALT = KeyboardKey.KEY_LEFT_ALT;
alias KEY_LEFT_SUPER = KeyboardKey.KEY_LEFT_SUPER;
alias KEY_RIGHT_SHIFT = KeyboardKey.KEY_RIGHT_SHIFT;
alias KEY_RIGHT_CONTROL = KeyboardKey.KEY_RIGHT_CONTROL;
alias KEY_RIGHT_ALT = KeyboardKey.KEY_RIGHT_ALT;
alias KEY_RIGHT_SUPER = KeyboardKey.KEY_RIGHT_SUPER;
alias KEY_KB_MENU = KeyboardKey.KEY_KB_MENU;
alias KEY_KP_0 = KeyboardKey.KEY_KP_0;
alias KEY_KP_1 = KeyboardKey.KEY_KP_1;
alias KEY_KP_2 = KeyboardKey.KEY_KP_2;
alias KEY_KP_3 = KeyboardKey.KEY_KP_3;
alias KEY_KP_4 = KeyboardKey.KEY_KP_4;
alias KEY_KP_5 = KeyboardKey.KEY_KP_5;
alias KEY_KP_6 = KeyboardKey.KEY_KP_6;
alias KEY_KP_7 = KeyboardKey.KEY_KP_7;
alias KEY_KP_8 = KeyboardKey.KEY_KP_8;
alias KEY_KP_9 = KeyboardKey.KEY_KP_9;
alias KEY_KP_DECIMAL = KeyboardKey.KEY_KP_DECIMAL;
alias KEY_KP_DIVIDE = KeyboardKey.KEY_KP_DIVIDE;
alias KEY_KP_MULTIPLY = KeyboardKey.KEY_KP_MULTIPLY;
alias KEY_KP_SUBTRACT = KeyboardKey.KEY_KP_SUBTRACT;
alias KEY_KP_ADD = KeyboardKey.KEY_KP_ADD;
alias KEY_KP_ENTER = KeyboardKey.KEY_KP_ENTER;
alias KEY_KP_EQUAL = KeyboardKey.KEY_KP_EQUAL;
alias KEY_BACK = KeyboardKey.KEY_BACK;
alias KEY_MENU = KeyboardKey.KEY_MENU;
alias KEY_VOLUME_UP = KeyboardKey.KEY_VOLUME_UP;
alias KEY_VOLUME_DOWN = KeyboardKey.KEY_VOLUME_DOWN;
enum MouseButton {
   MOUSE_BUTTON_LEFT = 0,
   MOUSE_BUTTON_RIGHT = 1,
   MOUSE_BUTTON_MIDDLE = 2,
   MOUSE_BUTTON_SIDE = 3,
   MOUSE_BUTTON_EXTRA = 4,
   MOUSE_BUTTON_FORWARD = 5,
   MOUSE_BUTTON_BACK = 6,
}

alias MOUSE_BUTTON_LEFT = MouseButton.MOUSE_BUTTON_LEFT;
alias MOUSE_BUTTON_RIGHT = MouseButton.MOUSE_BUTTON_RIGHT;
alias MOUSE_BUTTON_MIDDLE = MouseButton.MOUSE_BUTTON_MIDDLE;
alias MOUSE_BUTTON_SIDE = MouseButton.MOUSE_BUTTON_SIDE;
alias MOUSE_BUTTON_EXTRA = MouseButton.MOUSE_BUTTON_EXTRA;
alias MOUSE_BUTTON_FORWARD = MouseButton.MOUSE_BUTTON_FORWARD;
alias MOUSE_BUTTON_BACK = MouseButton.MOUSE_BUTTON_BACK;
enum MouseCursor {
   MOUSE_CURSOR_DEFAULT = 0,
   MOUSE_CURSOR_ARROW = 1,
   MOUSE_CURSOR_IBEAM = 2,
   MOUSE_CURSOR_CROSSHAIR = 3,
   MOUSE_CURSOR_POINTING_HAND = 4,
   MOUSE_CURSOR_RESIZE_EW = 5,
   MOUSE_CURSOR_RESIZE_NS = 6,
   MOUSE_CURSOR_RESIZE_NWSE = 7,
   MOUSE_CURSOR_RESIZE_NESW = 8,
   MOUSE_CURSOR_RESIZE_ALL = 9,
   MOUSE_CURSOR_NOT_ALLOWED = 10,
}

alias MOUSE_CURSOR_DEFAULT = MouseCursor.MOUSE_CURSOR_DEFAULT;
alias MOUSE_CURSOR_ARROW = MouseCursor.MOUSE_CURSOR_ARROW;
alias MOUSE_CURSOR_IBEAM = MouseCursor.MOUSE_CURSOR_IBEAM;
alias MOUSE_CURSOR_CROSSHAIR = MouseCursor.MOUSE_CURSOR_CROSSHAIR;
alias MOUSE_CURSOR_POINTING_HAND = MouseCursor.MOUSE_CURSOR_POINTING_HAND;
alias MOUSE_CURSOR_RESIZE_EW = MouseCursor.MOUSE_CURSOR_RESIZE_EW;
alias MOUSE_CURSOR_RESIZE_NS = MouseCursor.MOUSE_CURSOR_RESIZE_NS;
alias MOUSE_CURSOR_RESIZE_NWSE = MouseCursor.MOUSE_CURSOR_RESIZE_NWSE;
alias MOUSE_CURSOR_RESIZE_NESW = MouseCursor.MOUSE_CURSOR_RESIZE_NESW;
alias MOUSE_CURSOR_RESIZE_ALL = MouseCursor.MOUSE_CURSOR_RESIZE_ALL;
alias MOUSE_CURSOR_NOT_ALLOWED = MouseCursor.MOUSE_CURSOR_NOT_ALLOWED;
enum GamepadButton {
   GAMEPAD_BUTTON_UNKNOWN = 0,
   GAMEPAD_BUTTON_LEFT_FACE_UP = 1,
   GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,
   GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,
   GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,
   GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,
   GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,
   GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,
   GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,
   GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,
   GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,
   GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,
   GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12,
   GAMEPAD_BUTTON_MIDDLE_LEFT = 13,
   GAMEPAD_BUTTON_MIDDLE = 14,
   GAMEPAD_BUTTON_MIDDLE_RIGHT = 15,
   GAMEPAD_BUTTON_LEFT_THUMB = 16,
   GAMEPAD_BUTTON_RIGHT_THUMB = 17,
}

alias GAMEPAD_BUTTON_UNKNOWN = GamepadButton.GAMEPAD_BUTTON_UNKNOWN;
alias GAMEPAD_BUTTON_LEFT_FACE_UP = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_UP;
alias GAMEPAD_BUTTON_LEFT_FACE_RIGHT = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_RIGHT;
alias GAMEPAD_BUTTON_LEFT_FACE_DOWN = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_DOWN;
alias GAMEPAD_BUTTON_LEFT_FACE_LEFT = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_LEFT;
alias GAMEPAD_BUTTON_RIGHT_FACE_UP = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_UP;
alias GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_RIGHT;
alias GAMEPAD_BUTTON_RIGHT_FACE_DOWN = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_DOWN;
alias GAMEPAD_BUTTON_RIGHT_FACE_LEFT = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_LEFT;
alias GAMEPAD_BUTTON_LEFT_TRIGGER_1 = GamepadButton.GAMEPAD_BUTTON_LEFT_TRIGGER_1;
alias GAMEPAD_BUTTON_LEFT_TRIGGER_2 = GamepadButton.GAMEPAD_BUTTON_LEFT_TRIGGER_2;
alias GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = GamepadButton.GAMEPAD_BUTTON_RIGHT_TRIGGER_1;
alias GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = GamepadButton.GAMEPAD_BUTTON_RIGHT_TRIGGER_2;
alias GAMEPAD_BUTTON_MIDDLE_LEFT = GamepadButton.GAMEPAD_BUTTON_MIDDLE_LEFT;
alias GAMEPAD_BUTTON_MIDDLE = GamepadButton.GAMEPAD_BUTTON_MIDDLE;
alias GAMEPAD_BUTTON_MIDDLE_RIGHT = GamepadButton.GAMEPAD_BUTTON_MIDDLE_RIGHT;
alias GAMEPAD_BUTTON_LEFT_THUMB = GamepadButton.GAMEPAD_BUTTON_LEFT_THUMB;
alias GAMEPAD_BUTTON_RIGHT_THUMB = GamepadButton.GAMEPAD_BUTTON_RIGHT_THUMB;
enum GamepadAxis {
   GAMEPAD_AXIS_LEFT_X = 0,
   GAMEPAD_AXIS_LEFT_Y = 1,
   GAMEPAD_AXIS_RIGHT_X = 2,
   GAMEPAD_AXIS_RIGHT_Y = 3,
   GAMEPAD_AXIS_LEFT_TRIGGER = 4,
   GAMEPAD_AXIS_RIGHT_TRIGGER = 5,
}

alias GAMEPAD_AXIS_LEFT_X = GamepadAxis.GAMEPAD_AXIS_LEFT_X;
alias GAMEPAD_AXIS_LEFT_Y = GamepadAxis.GAMEPAD_AXIS_LEFT_Y;
alias GAMEPAD_AXIS_RIGHT_X = GamepadAxis.GAMEPAD_AXIS_RIGHT_X;
alias GAMEPAD_AXIS_RIGHT_Y = GamepadAxis.GAMEPAD_AXIS_RIGHT_Y;
alias GAMEPAD_AXIS_LEFT_TRIGGER = GamepadAxis.GAMEPAD_AXIS_LEFT_TRIGGER;
alias GAMEPAD_AXIS_RIGHT_TRIGGER = GamepadAxis.GAMEPAD_AXIS_RIGHT_TRIGGER;
enum MaterialMapIndex {
   MATERIAL_MAP_ALBEDO = 0,
   MATERIAL_MAP_METALNESS = 1,
   MATERIAL_MAP_NORMAL = 2,
   MATERIAL_MAP_ROUGHNESS = 3,
   MATERIAL_MAP_OCCLUSION = 4,
   MATERIAL_MAP_EMISSION = 5,
   MATERIAL_MAP_HEIGHT = 6,
   MATERIAL_MAP_CUBEMAP = 7,
   MATERIAL_MAP_IRRADIANCE = 8,
   MATERIAL_MAP_PREFILTER = 9,
   MATERIAL_MAP_BRDF = 10,
}

alias MATERIAL_MAP_ALBEDO = MaterialMapIndex.MATERIAL_MAP_ALBEDO;
alias MATERIAL_MAP_METALNESS = MaterialMapIndex.MATERIAL_MAP_METALNESS;
alias MATERIAL_MAP_NORMAL = MaterialMapIndex.MATERIAL_MAP_NORMAL;
alias MATERIAL_MAP_ROUGHNESS = MaterialMapIndex.MATERIAL_MAP_ROUGHNESS;
alias MATERIAL_MAP_OCCLUSION = MaterialMapIndex.MATERIAL_MAP_OCCLUSION;
alias MATERIAL_MAP_EMISSION = MaterialMapIndex.MATERIAL_MAP_EMISSION;
alias MATERIAL_MAP_HEIGHT = MaterialMapIndex.MATERIAL_MAP_HEIGHT;
alias MATERIAL_MAP_CUBEMAP = MaterialMapIndex.MATERIAL_MAP_CUBEMAP;
alias MATERIAL_MAP_IRRADIANCE = MaterialMapIndex.MATERIAL_MAP_IRRADIANCE;
alias MATERIAL_MAP_PREFILTER = MaterialMapIndex.MATERIAL_MAP_PREFILTER;
alias MATERIAL_MAP_BRDF = MaterialMapIndex.MATERIAL_MAP_BRDF;
enum ShaderLocationIndex {
   SHADER_LOC_VERTEX_POSITION = 0,
   SHADER_LOC_VERTEX_TEXCOORD01 = 1,
   SHADER_LOC_VERTEX_TEXCOORD02 = 2,
   SHADER_LOC_VERTEX_NORMAL = 3,
   SHADER_LOC_VERTEX_TANGENT = 4,
   SHADER_LOC_VERTEX_COLOR = 5,
   SHADER_LOC_MATRIX_MVP = 6,
   SHADER_LOC_MATRIX_VIEW = 7,
   SHADER_LOC_MATRIX_PROJECTION = 8,
   SHADER_LOC_MATRIX_MODEL = 9,
   SHADER_LOC_MATRIX_NORMAL = 10,
   SHADER_LOC_VECTOR_VIEW = 11,
   SHADER_LOC_COLOR_DIFFUSE = 12,
   SHADER_LOC_COLOR_SPECULAR = 13,
   SHADER_LOC_COLOR_AMBIENT = 14,
   SHADER_LOC_MAP_ALBEDO = 15,
   SHADER_LOC_MAP_METALNESS = 16,
   SHADER_LOC_MAP_NORMAL = 17,
   SHADER_LOC_MAP_ROUGHNESS = 18,
   SHADER_LOC_MAP_OCCLUSION = 19,
   SHADER_LOC_MAP_EMISSION = 20,
   SHADER_LOC_MAP_HEIGHT = 21,
   SHADER_LOC_MAP_CUBEMAP = 22,
   SHADER_LOC_MAP_IRRADIANCE = 23,
   SHADER_LOC_MAP_PREFILTER = 24,
   SHADER_LOC_MAP_BRDF = 25,
}

alias SHADER_LOC_VERTEX_POSITION = ShaderLocationIndex.SHADER_LOC_VERTEX_POSITION;
alias SHADER_LOC_VERTEX_TEXCOORD01 = ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD01;
alias SHADER_LOC_VERTEX_TEXCOORD02 = ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD02;
alias SHADER_LOC_VERTEX_NORMAL = ShaderLocationIndex.SHADER_LOC_VERTEX_NORMAL;
alias SHADER_LOC_VERTEX_TANGENT = ShaderLocationIndex.SHADER_LOC_VERTEX_TANGENT;
alias SHADER_LOC_VERTEX_COLOR = ShaderLocationIndex.SHADER_LOC_VERTEX_COLOR;
alias SHADER_LOC_MATRIX_MVP = ShaderLocationIndex.SHADER_LOC_MATRIX_MVP;
alias SHADER_LOC_MATRIX_VIEW = ShaderLocationIndex.SHADER_LOC_MATRIX_VIEW;
alias SHADER_LOC_MATRIX_PROJECTION = ShaderLocationIndex.SHADER_LOC_MATRIX_PROJECTION;
alias SHADER_LOC_MATRIX_MODEL = ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL;
alias SHADER_LOC_MATRIX_NORMAL = ShaderLocationIndex.SHADER_LOC_MATRIX_NORMAL;
alias SHADER_LOC_VECTOR_VIEW = ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW;
alias SHADER_LOC_COLOR_DIFFUSE = ShaderLocationIndex.SHADER_LOC_COLOR_DIFFUSE;
alias SHADER_LOC_COLOR_SPECULAR = ShaderLocationIndex.SHADER_LOC_COLOR_SPECULAR;
alias SHADER_LOC_COLOR_AMBIENT = ShaderLocationIndex.SHADER_LOC_COLOR_AMBIENT;
alias SHADER_LOC_MAP_ALBEDO = ShaderLocationIndex.SHADER_LOC_MAP_ALBEDO;
alias SHADER_LOC_MAP_METALNESS = ShaderLocationIndex.SHADER_LOC_MAP_METALNESS;
alias SHADER_LOC_MAP_NORMAL = ShaderLocationIndex.SHADER_LOC_MAP_NORMAL;
alias SHADER_LOC_MAP_ROUGHNESS = ShaderLocationIndex.SHADER_LOC_MAP_ROUGHNESS;
alias SHADER_LOC_MAP_OCCLUSION = ShaderLocationIndex.SHADER_LOC_MAP_OCCLUSION;
alias SHADER_LOC_MAP_EMISSION = ShaderLocationIndex.SHADER_LOC_MAP_EMISSION;
alias SHADER_LOC_MAP_HEIGHT = ShaderLocationIndex.SHADER_LOC_MAP_HEIGHT;
alias SHADER_LOC_MAP_CUBEMAP = ShaderLocationIndex.SHADER_LOC_MAP_CUBEMAP;
alias SHADER_LOC_MAP_IRRADIANCE = ShaderLocationIndex.SHADER_LOC_MAP_IRRADIANCE;
alias SHADER_LOC_MAP_PREFILTER = ShaderLocationIndex.SHADER_LOC_MAP_PREFILTER;
alias SHADER_LOC_MAP_BRDF = ShaderLocationIndex.SHADER_LOC_MAP_BRDF;
enum ShaderUniformDataType {
   SHADER_UNIFORM_FLOAT = 0,
   SHADER_UNIFORM_VEC2 = 1,
   SHADER_UNIFORM_VEC3 = 2,
   SHADER_UNIFORM_VEC4 = 3,
   SHADER_UNIFORM_INT = 4,
   SHADER_UNIFORM_IVEC2 = 5,
   SHADER_UNIFORM_IVEC3 = 6,
   SHADER_UNIFORM_IVEC4 = 7,
   SHADER_UNIFORM_SAMPLER2D = 8,
}

alias SHADER_UNIFORM_FLOAT = ShaderUniformDataType.SHADER_UNIFORM_FLOAT;
alias SHADER_UNIFORM_VEC2 = ShaderUniformDataType.SHADER_UNIFORM_VEC2;
alias SHADER_UNIFORM_VEC3 = ShaderUniformDataType.SHADER_UNIFORM_VEC3;
alias SHADER_UNIFORM_VEC4 = ShaderUniformDataType.SHADER_UNIFORM_VEC4;
alias SHADER_UNIFORM_INT = ShaderUniformDataType.SHADER_UNIFORM_INT;
alias SHADER_UNIFORM_IVEC2 = ShaderUniformDataType.SHADER_UNIFORM_IVEC2;
alias SHADER_UNIFORM_IVEC3 = ShaderUniformDataType.SHADER_UNIFORM_IVEC3;
alias SHADER_UNIFORM_IVEC4 = ShaderUniformDataType.SHADER_UNIFORM_IVEC4;
alias SHADER_UNIFORM_SAMPLER2D = ShaderUniformDataType.SHADER_UNIFORM_SAMPLER2D;
enum ShaderAttributeDataType {
   SHADER_ATTRIB_FLOAT = 0,
   SHADER_ATTRIB_VEC2 = 1,
   SHADER_ATTRIB_VEC3 = 2,
   SHADER_ATTRIB_VEC4 = 3,
}

alias SHADER_ATTRIB_FLOAT = ShaderAttributeDataType.SHADER_ATTRIB_FLOAT;
alias SHADER_ATTRIB_VEC2 = ShaderAttributeDataType.SHADER_ATTRIB_VEC2;
alias SHADER_ATTRIB_VEC3 = ShaderAttributeDataType.SHADER_ATTRIB_VEC3;
alias SHADER_ATTRIB_VEC4 = ShaderAttributeDataType.SHADER_ATTRIB_VEC4;
enum PixelFormat {
   PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
   PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,
   PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,
   PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,
   PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5,
   PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,
   PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,
   PIXELFORMAT_UNCOMPRESSED_R32 = 8,
   PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,
   PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10,
   PIXELFORMAT_COMPRESSED_DXT1_RGB = 11,
   PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12,
   PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13,
   PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14,
   PIXELFORMAT_COMPRESSED_ETC1_RGB = 15,
   PIXELFORMAT_COMPRESSED_ETC2_RGB = 16,
   PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17,
   PIXELFORMAT_COMPRESSED_PVRT_RGB = 18,
   PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19,
   PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20,
   PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21,
}

alias PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = PixelFormat.PIXELFORMAT_UNCOMPRESSED_GRAYSCALE;
alias PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = PixelFormat.PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA;
alias PIXELFORMAT_UNCOMPRESSED_R5G6B5 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R5G6B5;
alias PIXELFORMAT_UNCOMPRESSED_R8G8B8 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8;
alias PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R5G5B5A1;
alias PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R4G4B4A4;
alias PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;
alias PIXELFORMAT_UNCOMPRESSED_R32 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32;
alias PIXELFORMAT_UNCOMPRESSED_R32G32B32 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32;
alias PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32A32;
alias PIXELFORMAT_COMPRESSED_DXT1_RGB = PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGB;
alias PIXELFORMAT_COMPRESSED_DXT1_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGBA;
alias PIXELFORMAT_COMPRESSED_DXT3_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_DXT3_RGBA;
alias PIXELFORMAT_COMPRESSED_DXT5_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_DXT5_RGBA;
alias PIXELFORMAT_COMPRESSED_ETC1_RGB = PixelFormat.PIXELFORMAT_COMPRESSED_ETC1_RGB;
alias PIXELFORMAT_COMPRESSED_ETC2_RGB = PixelFormat.PIXELFORMAT_COMPRESSED_ETC2_RGB;
alias PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA;
alias PIXELFORMAT_COMPRESSED_PVRT_RGB = PixelFormat.PIXELFORMAT_COMPRESSED_PVRT_RGB;
alias PIXELFORMAT_COMPRESSED_PVRT_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_PVRT_RGBA;
alias PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA;
alias PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA;
enum TextureFilter {
   TEXTURE_FILTER_POINT = 0,
   TEXTURE_FILTER_BILINEAR = 1,
   TEXTURE_FILTER_TRILINEAR = 2,
   TEXTURE_FILTER_ANISOTROPIC_4X = 3,
   TEXTURE_FILTER_ANISOTROPIC_8X = 4,
   TEXTURE_FILTER_ANISOTROPIC_16X = 5,
}

alias TEXTURE_FILTER_POINT = TextureFilter.TEXTURE_FILTER_POINT;
alias TEXTURE_FILTER_BILINEAR = TextureFilter.TEXTURE_FILTER_BILINEAR;
alias TEXTURE_FILTER_TRILINEAR = TextureFilter.TEXTURE_FILTER_TRILINEAR;
alias TEXTURE_FILTER_ANISOTROPIC_4X = TextureFilter.TEXTURE_FILTER_ANISOTROPIC_4X;
alias TEXTURE_FILTER_ANISOTROPIC_8X = TextureFilter.TEXTURE_FILTER_ANISOTROPIC_8X;
alias TEXTURE_FILTER_ANISOTROPIC_16X = TextureFilter.TEXTURE_FILTER_ANISOTROPIC_16X;
enum TextureWrap {
   TEXTURE_WRAP_REPEAT = 0,
   TEXTURE_WRAP_CLAMP = 1,
   TEXTURE_WRAP_MIRROR_REPEAT = 2,
   TEXTURE_WRAP_MIRROR_CLAMP = 3,
}

alias TEXTURE_WRAP_REPEAT = TextureWrap.TEXTURE_WRAP_REPEAT;
alias TEXTURE_WRAP_CLAMP = TextureWrap.TEXTURE_WRAP_CLAMP;
alias TEXTURE_WRAP_MIRROR_REPEAT = TextureWrap.TEXTURE_WRAP_MIRROR_REPEAT;
alias TEXTURE_WRAP_MIRROR_CLAMP = TextureWrap.TEXTURE_WRAP_MIRROR_CLAMP;
enum CubemapLayout {
   CUBEMAP_LAYOUT_AUTO_DETECT = 0,
   CUBEMAP_LAYOUT_LINE_VERTICAL = 1,
   CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2,
   CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3,
   CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4,
   CUBEMAP_LAYOUT_PANORAMA = 5,
}

alias CUBEMAP_LAYOUT_AUTO_DETECT = CubemapLayout.CUBEMAP_LAYOUT_AUTO_DETECT;
alias CUBEMAP_LAYOUT_LINE_VERTICAL = CubemapLayout.CUBEMAP_LAYOUT_LINE_VERTICAL;
alias CUBEMAP_LAYOUT_LINE_HORIZONTAL = CubemapLayout.CUBEMAP_LAYOUT_LINE_HORIZONTAL;
alias CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = CubemapLayout.CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR;
alias CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = CubemapLayout.CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE;
alias CUBEMAP_LAYOUT_PANORAMA = CubemapLayout.CUBEMAP_LAYOUT_PANORAMA;
enum FontType {
   FONT_DEFAULT = 0,
   FONT_BITMAP = 1,
   FONT_SDF = 2,
}

alias FONT_DEFAULT = FontType.FONT_DEFAULT;
alias FONT_BITMAP = FontType.FONT_BITMAP;
alias FONT_SDF = FontType.FONT_SDF;
enum BlendMode {
   BLEND_ALPHA = 0,
   BLEND_ADDITIVE = 1,
   BLEND_MULTIPLIED = 2,
   BLEND_ADD_COLORS = 3,
   BLEND_SUBTRACT_COLORS = 4,
   BLEND_CUSTOM = 5,
}

alias BLEND_ALPHA = BlendMode.BLEND_ALPHA;
alias BLEND_ADDITIVE = BlendMode.BLEND_ADDITIVE;
alias BLEND_MULTIPLIED = BlendMode.BLEND_MULTIPLIED;
alias BLEND_ADD_COLORS = BlendMode.BLEND_ADD_COLORS;
alias BLEND_SUBTRACT_COLORS = BlendMode.BLEND_SUBTRACT_COLORS;
alias BLEND_CUSTOM = BlendMode.BLEND_CUSTOM;
enum Gesture {
   GESTURE_NONE = 0,
   GESTURE_TAP = 1,
   GESTURE_DOUBLETAP = 2,
   GESTURE_HOLD = 4,
   GESTURE_DRAG = 8,
   GESTURE_SWIPE_RIGHT = 16,
   GESTURE_SWIPE_LEFT = 32,
   GESTURE_SWIPE_UP = 64,
   GESTURE_SWIPE_DOWN = 128,
   GESTURE_PINCH_IN = 256,
   GESTURE_PINCH_OUT = 512,
}

alias GESTURE_NONE = Gesture.GESTURE_NONE;
alias GESTURE_TAP = Gesture.GESTURE_TAP;
alias GESTURE_DOUBLETAP = Gesture.GESTURE_DOUBLETAP;
alias GESTURE_HOLD = Gesture.GESTURE_HOLD;
alias GESTURE_DRAG = Gesture.GESTURE_DRAG;
alias GESTURE_SWIPE_RIGHT = Gesture.GESTURE_SWIPE_RIGHT;
alias GESTURE_SWIPE_LEFT = Gesture.GESTURE_SWIPE_LEFT;
alias GESTURE_SWIPE_UP = Gesture.GESTURE_SWIPE_UP;
alias GESTURE_SWIPE_DOWN = Gesture.GESTURE_SWIPE_DOWN;
alias GESTURE_PINCH_IN = Gesture.GESTURE_PINCH_IN;
alias GESTURE_PINCH_OUT = Gesture.GESTURE_PINCH_OUT;
enum CameraMode {
   CAMERA_CUSTOM = 0,
   CAMERA_FREE = 1,
   CAMERA_ORBITAL = 2,
   CAMERA_FIRST_PERSON = 3,
   CAMERA_THIRD_PERSON = 4,
}

alias CAMERA_CUSTOM = CameraMode.CAMERA_CUSTOM;
alias CAMERA_FREE = CameraMode.CAMERA_FREE;
alias CAMERA_ORBITAL = CameraMode.CAMERA_ORBITAL;
alias CAMERA_FIRST_PERSON = CameraMode.CAMERA_FIRST_PERSON;
alias CAMERA_THIRD_PERSON = CameraMode.CAMERA_THIRD_PERSON;
enum CameraProjection {
   CAMERA_PERSPECTIVE = 0,
   CAMERA_ORTHOGRAPHIC = 1,
}

alias CAMERA_PERSPECTIVE = CameraProjection.CAMERA_PERSPECTIVE;
alias CAMERA_ORTHOGRAPHIC = CameraProjection.CAMERA_ORTHOGRAPHIC;
enum NPatchLayout {
   NPATCH_NINE_PATCH = 0,
   NPATCH_THREE_PATCH_VERTICAL = 1,
   NPATCH_THREE_PATCH_HORIZONTAL = 2,
}

alias NPATCH_NINE_PATCH = NPatchLayout.NPATCH_NINE_PATCH;
alias NPATCH_THREE_PATCH_VERTICAL = NPatchLayout.NPATCH_THREE_PATCH_VERTICAL;
alias NPATCH_THREE_PATCH_HORIZONTAL = NPatchLayout.NPATCH_THREE_PATCH_HORIZONTAL;
