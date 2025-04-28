# permissions.py: Role-based access control

class Permissions:
    def __init__(self):
        self.roles = {}

    def add_role(self, user, role):
        self.roles[user] = role

    def check(self, user, required_role):
        return self.roles.get(user) == required_role
