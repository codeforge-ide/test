# app.py: Example usage/app entry for the UI framework prototype

from widget import Text, Column
from engine import UIEngine
from renderer import Renderer

def build_ui():
    return Column([
        Text("Hello"),
        Text("World"),
    ])

if __name__ == "__main__":
    engine = UIEngine(build_ui(), Renderer())
    engine.run()
