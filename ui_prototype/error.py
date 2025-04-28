# error.py: Error handling/logging system

class Logger:
    def log(self, message):
        print(f"[LOG] {message}")

    def error(self, message):
        print(f"[ERROR] {message}")

class ErrorBoundary:
    def __init__(self, child):
        self.child = child

    def render(self):
        try:
            return self.child.render()
        except Exception as e:
            print(f"[ErrorBoundary] Caught error: {e}")
            return None
