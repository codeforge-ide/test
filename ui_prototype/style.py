# style.py: Styling/theming system

class Style:
    def __init__(self, color=None, font_size=None, padding=None):
        self.color = color
        self.font_size = font_size
        self.padding = padding

class Theme:
    def __init__(self, primary_color, accent_color):
        self.primary_color = primary_color
        self.accent_color = accent_color
