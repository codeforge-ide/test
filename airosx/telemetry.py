# telemetry.py: Telemetry, analytics, and remote diagnostics

class Telemetry:
    def __init__(self):
        print("[Telemetry] Initialized")

    def send_metric(self, name, value):
        print(f"[Telemetry] {name}: {value}")

    def report_error(self, error):
        print(f"[Telemetry] Error reported: {error}")
