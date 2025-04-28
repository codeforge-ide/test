# input.py: Input handling (keyboard, mouse, touch, etc.)

class InputHandler:
    def on_key_press(self, key):
        print(f"Key pressed: {key}")

    def on_mouse_click(self, x, y):
        print(f"Mouse clicked at: ({x}, {y})")

    def on_touch(self, x, y):
        print(f"Touch at: ({x}, {y})")
