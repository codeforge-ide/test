# scheduler.py: Real-time and batch task scheduling

class Scheduler:
    def __init__(self):
        self.tasks = []
        print("[Scheduler] Initialized")

    def schedule(self, task, time):
        self.tasks.append((task, time))
        print(f"[Scheduler] Task scheduled: {task} at {time}")
