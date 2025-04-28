# app.py: Main entry, wiring everything together and simulating requests

from server import SimpleHTTPServer
from router import Router
from database import Database
from auth import Auth
from storage import Storage
from realtime import PubSub
from functions import Functions
from permissions import Permissions
from logger import Logger
from config import Config
from utils import json_response

# Initialize core systems
router = Router()
db = Database()
auth = Auth(db)
storage = Storage()
pubsub = PubSub()
functions = Functions()
permissions = Permissions()
logger = Logger()
config = Config({'debug': True})

# Example endpoints

def home_handler():
    return json_response("Welcome to the backend prototype!")

def signup_handler():
    return json_response(auth.signup("alice", "password123"))

def login_handler():
    return json_response(auth.login("alice", "password123"))

def upload_handler():
    return json_response(storage.upload("file.txt", "Hello World"))

def download_handler():
    return json_response(storage.download("file.txt"))

# Register routes
router.add_route("/", home_handler)
router.add_route("/signup", signup_handler)
router.add_route("/login", login_handler)
router.add_route("/upload", upload_handler)
router.add_route("/download", download_handler)

# Simulate server
if __name__ == "__main__":
    # Simulate direct calls (not real HTTP requests)
    print(home_handler())
    print(signup_handler())
    print(login_handler())
    print(upload_handler())
    print(download_handler())

    # Simulate pub/sub
    def on_message(msg):
        print(f"[PubSub] Received: {msg}")
    pubsub.subscribe("news", on_message)
    pubsub.publish("news", "Hello subscribers!")

    # Simulate serverless function
    functions.register("echo", lambda x: f"Echo: {x}")
    print(functions.call("echo", "Test"))

    # Simulate permissions
    permissions.add_role("alice", "admin")
    print("Is admin:", permissions.check("alice", "admin"))

    # Simulate logging
    logger.log("Server started")
    logger.error("Sample error")

    # Simulate config
    print("Debug mode:", config.get("debug"))

    # To run the actual socket server (blocking):
    # server = SimpleHTTPServer()
    # for path, handler in router.routes.items():
    #     server.add_route(path, handler)
    # server.serve_forever()
