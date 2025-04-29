# device.py: Device manager (drivers for sensors, actuators, peripherals)

class DeviceManager:
    def __init__(self):
        self.devices = []
        print("[DeviceManager] Initialized")

    def register_device(self, device):
        self.devices.append(device)
        print(f"[DeviceManager] Device registered: {device}")
