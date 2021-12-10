import bindbc.raylib;
import std.experimental.logger;

void main() {
   trace("primma");

	InitWindow(800, 600, "Newton's Forest");
	SetTargetFPS(60);
	while (!WindowShouldClose()) {
		BeginDrawing();
		ClearBackground(GREEN);
		DrawText("Hello world!", 200, 200, 32, RED);
		EndDrawing();
	}
	CloseWindow();
}
