from food_item import FoodItem

class DCT():
    def __init__(self):
        self.menu = []

    """
        save_food_item adds a food item to the tracked menu

        name: str
            The name of the food item
        station: str
            The station the food item can be fouhnd in

        meal_time: str
            The meal time the food item will be served

        category: str
            The categories the food item can be found in

        returns: FoodItem
            The food item added to the menu
    """
    def save_food_item(self, name: str, station: str, meal_time: str, category: str) -> FoodItem:
        item = FoodItem(name, station, meal_time, category)
        self.menu.append(item)
        return item
