from food_item import FoodItem
from dct_capacity import Capacity

class DCT():
    def __init__(self):
        self.menu = []
        self.stations = []
        self.takeout_capacity = 0
        self.dinein_capacity = 0
        self.total_capacity = 0

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
        incoming_dct_traffic adds people who are scanning into the dct

        takeout: int
            The current number of takeout scanning in

        dinein: int
            The current number of dinein scanning in

        returns: Capacity
            The total number of takeout, dineine, and total capacity
            of takeout + dinein
    """
    def incoming_dct_traffic(self, takeout: int, dinein: int) -> Capacity:
        self.takeout_capacity += takeout
        self.dinein_capacity += dinein
        incomingtraffic = takeout + dinein
        self.total_capacity += incomingtraffic
        capacity = Capacity(takeout, dinein, incomingtraffic)
        return capacity

    """
        outgoing_dct_traffic subtracts people who are leaving the dct

        takeout: int
            The current number of takeout leaving

        dinein: int
            The current number of dinein leaving

        returns: Capacity
            The total number of takeout, dineine, and total capacity
            of takeout + dinein
    """
    def outgoing_dct_traffic(self, takeout: int, dinein: int) -> Capacity:
        if (self.takeout_capacity - takeout < 0):
            self.takeout_capacity = 0
        else:
            self.takeout_capacity -= takeout
        if (self.dinein_capacity - dinein < 0):
            self.dinein_capacity = 0
        else:
            self.dinein_capacity -= dinein
        outgoingtraffic = takeout + dinein
        if (self.total_capacity - outgoingtraffic < 0):
            self.total_capacity = 0
        else:
            self.total_capacity -= outgoingtraffic
        capacity = Capacity(takeout, dinein, outgoingtraffic)
        return capacity
