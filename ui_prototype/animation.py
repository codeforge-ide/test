# animation.py: Animation system for transitions and effects

class Animation:
    def __init__(self, duration, on_update):
        self.duration = duration
        self.on_update = on_update

    def start(self):
        print(f"Animation started for {self.duration}ms")
        # Prototype: just call on_update once
        self.on_update(1.0)
