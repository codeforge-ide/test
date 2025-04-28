# metrics.py: Metrics and monitoring

class Metrics:
    def __init__(self):
        self.counters = {}

    def increment(self, name):
        self.counters[name] = self.counters.get(name, 0) + 1
        print(f"Metric '{name}' incremented to {self.counters[name]}")

    def get(self, name):
        return self.counters.get(name, 0)
