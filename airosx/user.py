# user.py: User/session management

class UserManager:
    def __init__(self):
        self.users = {}
        print("[UserManager] Initialized")

    def add_user(self, username, info):
        self.users[username] = info
        print(f"[UserManager] User added: {username}")

    def get_user(self, username):
        print(f"[UserManager] Get user: {username}")
        return self.users.get(username)
