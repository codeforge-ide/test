# storage.py: File/object storage abstraction

class Storage:
    def __init__(self):
        self.files = {}

    def upload(self, filename, content):
        self.files[filename] = content
        return {'message': f'{filename} uploaded'}

    def download(self, filename):
        content = self.files.get(filename)
        if content is not None:
            return {'filename': filename, 'content': content}
        return {'error': 'File not found'}
