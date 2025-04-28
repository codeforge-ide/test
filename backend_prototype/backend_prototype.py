# Pure Python prototype for a backend framework (no external libraries)

users = {}

def signup(username, password):
    if username in users:
        return {"error": "User exists"}, 400
    users[username] = password
    return {"message": "User created"}, 200

def login(username, password):
    if users.get(username) == password:
        return {"message": "Login successful"}, 200
    return {"error": "Invalid credentials"}, 401

def get_data():
    return {"data": ["item1", "item2"]}, 200

# Simulate requests
if __name__ == "__main__":
    print("Signup:", signup("alice", "password123"))
    print("Signup (again):", signup("alice", "password123"))
    print("Login (wrong):", login("alice", "wrongpass"))
    print("Login (correct):", login("alice", "password123"))
    print("Data:", get_data())
