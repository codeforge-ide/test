# router.py: Request routing and endpoint management

class Router:
    def __init__(self):
        self.routes = {}

    def add_route(self, path, handler):
        self.routes[path] = handler

    def resolve(self, path):
        return self.routes.get(path, self.not_found)

    def not_found(self):
        return 'HTTP/1.1 404 Not Found\n\nNot Found'
