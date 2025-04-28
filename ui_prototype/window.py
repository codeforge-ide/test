# window.py: Window and viewport management

class Window:
    def __init__(self, title, width, height):
        self.title = title
        self.width = width
        self.height = height
        print(f"Window created: {title} ({width}x{height})")

    def show(self):
        print(f"Showing window: {self.title}")
