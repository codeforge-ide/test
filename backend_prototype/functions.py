# functions.py: Serverless function execution (simulated)

class Functions:
    def __init__(self):
        self.registry = {}

    def register(self, name, func):
        self.registry[name] = func

    def call(self, name, *args, **kwargs):
        func = self.registry.get(name)
        if func:
            return func(*args, **kwargs)
        return {'error': 'Function not found'}
