# logger.py: Logging and error handling

class Logger:
    def log(self, message):
        print(f"[LOG] {message}")

    def error(self, message):
        print(f"[ERROR] {message}")
