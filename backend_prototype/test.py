# test.py: Simple test harness for endpoints and modules

class TestHarness:
    def __init__(self):
        self.tests = []

    def add_test(self, name, func):
        self.tests.append((name, func))

    def run(self):
        for name, func in self.tests:
            try:
                print(f"Running test: {name}")
                func()
                print(f"Test '{name}' passed")
            except Exception as e:
                print(f"Test '{name}' failed: {e}")
