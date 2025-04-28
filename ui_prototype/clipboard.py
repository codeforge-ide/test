# clipboard.py: Clipboard/data transfer support

class Clipboard:
    def __init__(self):
        self.data = None

    def copy(self, data):
        self.data = data
        print(f"Copied to clipboard: {data}")

    def paste(self):
        print(f"Pasted from clipboard: {self.data}")
        return self.data
