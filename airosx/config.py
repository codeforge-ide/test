# config.py: System configuration and boot management

class Config:
    def __init__(self):
        self.settings = {}
        print("[Config] Initialized")

    def set(self, key, value):
        self.settings[key] = value
        print(f"[Config] Set {key} = {value}")

    def get(self, key, default=None):
        print(f"[Config] Get {key}")
        return self.settings.get(key, default)
