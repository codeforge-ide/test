# auth.py: Authentication and authorization

import hashlib

class Auth:
    def __init__(self, db):
        self.db = db
        if not self.db.table('users'):
            self.db.create_table('users')

    def signup(self, username, password):
        users = self.db.table('users')
        if users.find({'username': username}):
            return {'error': 'User exists'}
        hashed = self._hash(password)
        users.insert({'username': username, 'password': hashed})
        return {'message': 'User created'}

    def login(self, username, password):
        users = self.db.table('users')
        hashed = self._hash(password)
        user = users.find({'username': username, 'password': hashed})
        if user:
            return {'message': 'Login successful', 'token': 'dummy-token'}
        return {'error': 'Invalid credentials'}

    def _hash(self, password):
        return hashlib.sha256(password.encode()).hexdigest()
