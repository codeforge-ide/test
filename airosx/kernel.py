# kernel.py: Microkernel (process/thread/task management, scheduling, IPC)

class Kernel:
    def __init__(self):
        self.processes = []
        self.tasks = []
        print("[Kernel] Initialized")

    def create_process(self, name):
        self.processes.append(name)
        print(f"[Kernel] Process created: {name}")

    def schedule_task(self, task):
        self.tasks.append(task)
        print(f"[Kernel] Task scheduled: {task}")
