# ipc.py: Inter-process communication (message passing, shared memory - simulated)

class IPC:
    def __init__(self):
        self.channels = {}
        print("[IPC] Initialized")

    def send(self, channel, message):
        print(f"[IPC] Sent on {channel}: {message}")

    def receive(self, channel):
        print(f"[IPC] Receive on {channel}")
        return None
