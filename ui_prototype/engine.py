# engine.py: Core engine/entry point for the UI framework prototype

class UIEngine:
    def __init__(self, root_widget, renderer):
        self.root_widget = root_widget
        self.renderer = renderer

    def run(self):
        print("[Engine] Starting UI Engine...")
        tree = self.root_widget.build()
        self.renderer.render(tree)
