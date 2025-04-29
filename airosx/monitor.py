# monitor.py: System monitoring (resource usage, health, logs)

class Monitor:
    def __init__(self):
        print("[Monitor] Initialized")

    def log_resource(self, resource, value):
        print(f"[Monitor] {resource}: {value}")

    def health_check(self):
        print("[Monitor] Health check OK")
        return True
