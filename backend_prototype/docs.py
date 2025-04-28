# docs.py: API documentation generator (simulated)

class Docs:
    def __init__(self):
        self.endpoints = []

    def add_endpoint(self, path, description):
        self.endpoints.append((path, description))

    def generate(self):
        print("API Documentation:")
        for path, desc in self.endpoints:
            print(f"- {path}: {desc}")
