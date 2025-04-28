# realtime.py: Real-time pub/sub system (simulated)

class PubSub:
    def __init__(self):
        self.channels = {}

    def subscribe(self, channel, callback):
        if channel not in self.channels:
            self.channels[channel] = []
        self.channels[channel].append(callback)

    def publish(self, channel, message):
        for callback in self.channels.get(channel, []):
            callback(message)
