# fs.py: Filesystem abstraction (virtual files, device files, config)

class FileSystem:
    def __init__(self):
        self.files = {}
        print("[FileSystem] Initialized")

    def create_file(self, path, content):
        self.files[path] = content
        print(f"[FileSystem] File created: {path}")

    def read_file(self, path):
        print(f"[FileSystem] Reading file: {path}")
        return self.files.get(path, None)
