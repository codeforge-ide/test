# renderer.py: System for drawing/rendering UIs for the UI framework prototype

from widget import Text, Column

class Renderer:
    def render(self, widget, indent=0):
        prefix = '  ' * indent
        if isinstance(widget, Text):
            print(f"{prefix}Text('{widget.value}')")
        elif isinstance(widget, Column):
            print(f"{prefix}Column([")
            for child in widget.children:
                self.render(child, indent + 1)
            print(f"{prefix}])")
        else:
            print(f"{prefix}Unknown Widget")
