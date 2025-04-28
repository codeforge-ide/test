# cache.py: In-memory caching system

class Cache:
    def __init__(self):
        self.store = {}

    def set(self, key, value):
        self.store[key] = value
        print(f"Cached: {key} = {value}")

    def get(self, key):
        value = self.store.get(key)
        print(f"Cache get: {key} = {value}")
        return value
