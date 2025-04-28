# app.py: Example usage/app entry for the UI framework prototype

from widget import Text, Column
from engine import UIEngine
from renderer import Renderer
from state import State
from event import on_click, Event
from style import Style, Theme
from navigation import Navigator
from animation import Animation
from input import InputHandler
from window import Window
from clipboard import Clipboard
from dragdrop import DragDropManager
from inspector import Inspector
from plugin import Plugin, PluginManager
from persistence import Persistence
from localization import Localization
from accessibility import Accessibility
from error import Logger, ErrorBoundary
from scheduler import Scheduler

def build_ui():
    return Column([
        Text("Hello"),
        Text("World"),
    ])

if __name__ == "__main__":
    # Window
    window = Window("Demo App", 800, 600)
    window.show()

    # State
    counter = State(0)
    counter.subscribe(lambda v: print(f"Counter updated: {v}"))
    counter.set(1)

    # Event
    def on_btn_click():
        print("Button clicked!")
    on_click(None, on_btn_click)

    # Style/Theme
    style = Style(color="blue", font_size=16)
    theme = Theme(primary_color="blue", accent_color="red")

    # Navigation
    nav = Navigator()
    nav.push("HomeScreen")
    nav.push("DetailScreen")
    nav.pop()

    # Animation
    anim = Animation(500, lambda t: print(f"Animation progress: {t}"))
    anim.start()

    # Input
    input_handler = InputHandler()
    input_handler.on_key_press("A")
    input_handler.on_mouse_click(100, 200)

    # Clipboard
    clipboard = Clipboard()
    clipboard.copy("Hello!")
    clipboard.paste()

    # Drag & Drop
    dragdrop = DragDropManager()
    dragdrop.start_drag("WidgetA")
    dragdrop.drop("WidgetB")

    # Inspector
    inspector = Inspector()
    inspector.inspect_widget("TextWidget")
    inspector.inspect_state(counter.value)

    # Plugin
    plugin_mgr = PluginManager()
    plugin = Plugin("SamplePlugin")
    plugin_mgr.register(plugin)
    plugin.activate()

    # Persistence
    persistence = Persistence()
    persistence.save("key", "value")
    persistence.load("key")

    # Localization
    loc = Localization({"hello": "Bonjour"})
    print(loc.translate("hello"))

    # Accessibility
    acc = Accessibility()
    acc.announce("Welcome!")
    acc.set_focus("TextWidget")

    # Error/Logger
    logger = Logger()
    logger.log("App started")
    logger.error("Sample error")
    boundary = ErrorBoundary(child=Text("Error Test"))
    boundary.render()

    # Scheduler
    scheduler = Scheduler()
    scheduler.schedule(lambda: print("Task executed!"), 1000)
    scheduler.set_interval(lambda: print("Interval!"), 5000)

    # UI Rendering
    engine = UIEngine(build_ui(), Renderer())
    engine.run()
