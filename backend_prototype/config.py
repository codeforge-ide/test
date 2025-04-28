# config.py: Configuration management

class Config:
    def __init__(self, settings=None):
        self.settings = settings or {}

    def get(self, key, default=None):
        return self.settings.get(key, default)

    def set(self, key, value):
        self.settings[key] = value
