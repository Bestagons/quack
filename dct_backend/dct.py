from food_item import FoodItem
from station import Station 

class DCT():
    def __init__(self):
        self.menu = []
        self.stations = {}

    """
        save_station adds a station to the tracked station list

        name: str
            The name of the station
    """
    def save_station(self, name: str):
        station = Station(name)
        self.stations[name] = station

    """
        save_food_item adds a food item to the tracked menu of a specific station

        name: str
            The name of the food item

        station: str
            The station the food item can be found in

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

        # Checks to see whether the station of the food item has been created and adds item to the station
        # If not, creates then add item to station
        if self.stations.has_key(name):
            self.stations[station].add_food_item(item)
        else:
            self.save_station(station)
            self.stations[station].add_food_item(item)

        self.menu.append(item)
        return item

    """
        update_line_speed updates the line speed of the given station
        
        station: str 
            The station to update the line speed property

        line_speed: float
            The new speed of the station line
    """
    def update_line_speed(self, station: str, line_speed: float):
        self.stations[station].update_line_speed(line_speed)