from food_item import FoodItem
from food_station import FoodStation

class DCT():
    def __init__(self):
        self.menu = []
        self.stations = []

    """
        save_food_item adds a food item to the tracked menu

        name: str
            The name of the food item
        station: str
            The station the food item can be fouhnd in

        meal_time: str
            The meal time the food item will be served

        categories: list
            The categories the food item can be found in

        calories: int
            The amount of calories the food item has

        returns: FoodItem
            The food item added to the menu
    """
    def save_food_item(self, name: str, station: str, meal_time: str,
            calories: int, categories: list) -> FoodItem:
        item = FoodItem(name, station, meal_time, calories, categories)
        self.menu.append(item)
        return item

    """
        save_food_station adds a food station to the list of stations

        name: str
            The name of the food station
        
        returns: FoodStation
            The food station that was added to the list of food stations
    """
    def save_food_station(self, name: str) -> FoodStation:
        station = FoodStation(name)
        exists = False
        for s in self.stations:
            if (station.name == s.name):
                exists = True
        if (exists == False):
            self.stations.append(station)
        return station
