# event.py: Event handling system

def on_click(widget, callback):
    widget._on_click = callback

class Event:
    def __init__(self, type, data=None):
        self.type = type
        self.data = data
