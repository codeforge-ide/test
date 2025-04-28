# utils.py: Utility functions/helpers

def json_response(data, status=200):
    return f"HTTP/1.1 {status} OK\n\n{data}"

# Add more helpers as needed
