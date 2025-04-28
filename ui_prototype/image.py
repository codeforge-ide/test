# image.py: Image and asset management

class ImageAsset:
    def __init__(self, path):
        self.path = path
        print(f"Loaded image asset: {path}")

class AssetManager:
    def load(self, asset_path):
        print(f"Loading asset: {asset_path}")
        return ImageAsset(asset_path)
