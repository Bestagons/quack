from food_item import FoodItem

class Station():
    """
    name: str
        The name of the station

    menu: list of FoodItems
        The list of all food items within the station

    line_speed: float
        The speed of the line at the station
    """
    def __init__(self, name: str):
        self.name = name
        self.menu = []
        self.line_speed = 0

    def add_food_item(self, item: FoodItem):
        self.menu.append(item)

    def update_line_speed(self, new_speed: float):
        self.line_speed = new_speed