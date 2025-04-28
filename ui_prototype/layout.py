# layout.py: Layout system for arranging widgets

class Row:
    def __init__(self, children):
        self.children = children

class Stack:
    def __init__(self, children):
        self.children = children

class Flex:
    def __init__(self, children, direction='horizontal'):
        self.children = children
        self.direction = direction
