# queue.py: Message queue/job queue system

class Queue:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)
        print(f"Enqueued: {item}")

    def dequeue(self):
        if self.items:
            item = self.items.pop(0)
            print(f"Dequeued: {item}")
            return item
        print("Queue is empty")
        return None
