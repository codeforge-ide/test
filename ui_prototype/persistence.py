# persistence.py: Simple persistence/local storage system

class Persistence:
    def __init__(self):
        self.storage = {}

    def save(self, key, value):
        self.storage[key] = value
        print(f"Saved: {key} = {value}")

    def load(self, key):
        value = self.storage.get(key)
        print(f"Loaded: {key} = {value}")
        return value
