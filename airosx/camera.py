# camera.py: Camera and vision device abstraction

class Camera:
    def __init__(self):
        print("[Camera] Initialized")

    def capture(self):
        print("[Camera] Capturing image")
        return "image_data"

    def stream(self):
        print("[Camera] Streaming video")
