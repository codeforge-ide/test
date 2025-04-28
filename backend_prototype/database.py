# database.py: In-memory database abstraction

class Table:
    def __init__(self, name):
        self.name = name
        self.rows = []

    def insert(self, row):
        self.rows.append(row)
        return row

    def find(self, query):
        return [row for row in self.rows if all(row.get(k) == v for k, v in query.items())]

    def all(self):
        return self.rows

class Database:
    def __init__(self):
        self.tables = {}

    def create_table(self, name):
        self.tables[name] = Table(name)
        return self.tables[name]

    def table(self, name):
        return self.tables.get(name)
