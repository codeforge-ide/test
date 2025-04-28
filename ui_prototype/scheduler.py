# scheduler.py: Task scheduling and frame/timer management

class Scheduler:
    def schedule(self, task, delay_ms):
        print(f"Scheduled task '{task.__name__}' in {delay_ms}ms")
        # Prototype: call immediately
        task()

    def set_interval(self, task, interval_ms):
        print(f"Set interval for '{task.__name__}' every {interval_ms}ms")
