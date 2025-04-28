# migration.py: Database schema/version management

class Migration:
    def __init__(self):
        self.versions = []

    def add_version(self, version, description):
        self.versions.append((version, description))
        print(f"Migration added: {version} - {description}")

    def list_versions(self):
        return self.versions
