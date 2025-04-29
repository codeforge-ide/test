# bluetooth.py: Bluetooth and wireless peripheral management

class Bluetooth:
    def __init__(self):
        print("[Bluetooth] Initialized")

    def pair(self, device):
        print(f"[Bluetooth] Pairing with {device}")

    def send(self, device, data):
        print(f"[Bluetooth] Sending to {device}: {data}")
