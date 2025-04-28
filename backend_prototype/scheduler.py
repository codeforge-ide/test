# scheduler.py: Task scheduling, background jobs, and cron-like functionality

class Scheduler:
    def __init__(self):
        self.jobs = []

    def schedule(self, func, interval):
        self.jobs.append((func, interval))
        print(f"Scheduled job '{func.__name__}' every {interval}s")

    def run_all(self):
        for func, interval in self.jobs:
            print(f"Running job '{func.__name__}'")
            func()
