class Widget:
    def render(self):
        raise NotImplementedError

class Text(Widget):
    def __init__(self, value):
        self.value = value

    def render(self):
        return f"Text({self.value})"

class Column(Widget):
    def __init__(self, children):
        self.children = children

    def render(self):
        return "Column([\n  " + ",\n  ".join(child.render() for child in self.children) + "\n])"

# Example usage:
def build_ui():
    return Column([
        Text("Hello"),
        Text("World"),
    ])

if __name__ == "__main__":
    ui = build_ui()
    print(ui.render())
