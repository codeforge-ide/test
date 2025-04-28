# plugin.py: Plugin/extension system for third-party integrations

class Plugin:
    def __init__(self, name):
        self.name = name

    def activate(self):
        print(f"Plugin '{self.name}' activated")

class PluginManager:
    def __init__(self):
        self.plugins = []

    def register(self, plugin):
        self.plugins.append(plugin)
        print(f"Registered plugin: {plugin.name}")
