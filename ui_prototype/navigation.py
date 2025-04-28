# navigation.py: Navigation/routing system

class Navigator:
    def __init__(self):
        self.stack = []

    def push(self, screen):
        self.stack.append(screen)
        print(f"Navigated to {screen}")

    def pop(self):
        if self.stack:
            screen = self.stack.pop()
            print(f"Popped {screen}")
