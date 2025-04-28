# state.py: State management system

class State:
    def __init__(self, value):
        self.value = value
        self.listeners = []

    def set(self, value):
        self.value = value
        for listener in self.listeners:
            listener(value)

    def subscribe(self, listener):
        self.listeners.append(listener)
