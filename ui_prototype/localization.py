# localization.py: Internationalization/localization support

class Localization:
    def __init__(self, translations):
        self.translations = translations

    def translate(self, key):
        return self.translations.get(key, key)
