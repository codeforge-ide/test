# server.py: Core HTTP server (socket-based, no external dependencies)

import socket

class SimpleHTTPServer:
    def __init__(self, host='127.0.0.1', port=8080):
        self.host = host
        self.port = port
        self.routes = {}

    def add_route(self, path, handler):
        self.routes[path] = handler

    def serve_forever(self):
        print(f"[Server] Listening on {self.host}:{self.port}")
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.bind((self.host, self.port))
            s.listen()
            while True:
                conn, addr = s.accept()
                with conn:
                    data = conn.recv(1024)
                    if not data:
                        continue
                    request = data.decode()
                    path = self._parse_path(request)
                    handler = self.routes.get(path, self._not_found)
                    response = handler()
                    conn.sendall(response.encode())

    def _parse_path(self, request):
        try:
            return request.split(' ')[1]
        except Exception:
            return '/'

    def _not_found(self):
        return 'HTTP/1.1 404 Not Found\n\nNot Found'
