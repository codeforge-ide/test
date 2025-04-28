# widget.py: Base Widget and common widgets for the UI framework prototype

class Widget:
    def build(self):
        return self

class Text(Widget):
    def __init__(self, value):
        self.value = value

    def build(self):
        return self

class Column(Widget):
    def __init__(self, children):
        self.children = children

    def build(self):
        return self
