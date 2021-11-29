from food_item import FoodItem
from station import Station 

class DCT():
    def __init__(self):
        self.menu = []
        self.stations = {}
        self.serve_times = {}
        self.takeout_capacity = 0
        self.dinein_capacity = 0
        self.total_capacity = 0

    def clear_data(self):
        self.menu = []
        self.stations = {}
        self.serve_times = {}

    """
        save_station adds a station to the tracked station list

        name: str
            The name of the station
    """
    def save_station(self, name: str):
        station = Station(name)
        self.stations[name] = station
        return station

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
        if station in self.stations.keys():
            self.stations[station].add_food_item(item)
        else:
            self.save_station(station)
            self.stations[station].add_food_item(item)

        if item not in self.menu:
            self.menu.append(item)
        return item

    """
        save_serve_time saves a serving period and the time associated with it
        period: str
            A period of time (Ex: Breakfast)

        time: str
            The actual specified time of the period (Ex: 7am - 10am)
    """
    def save_serve_time(self, period: str, time: str):
        self.serve_times[period] = time

    """
        update_line_speed updates the line speed of the given station

        station: str 
            The station to update the line speed property
        line_speed: float
            The new speed of the station line
    """
    def update_line_speed(self, station: str, line_speed: float):
        if station in self.stations:
            self.stations[station].update_line_speed(line_speed)
            
    """
        incoming_dct_traffic adds people who are scanning into the dct

        takeout: int
            The current number of takeout scanning in
        dinein: int
            The current number of dinein scanning in
        returns: 
            self.takeout_capacity, self.dinein_capacity, self.total_capacity
    """
    def incoming_dct_traffic(self, takeout: int, dinein: int):
        self.takeout_capacity += takeout
        self.dinein_capacity += dinein
        incomingtraffic = takeout + dinein
        self.total_capacity += incomingtraffic
        return self.takeout_capacity, self.dinein_capacity, self.total_capacity

    """
        outgoing_dct_traffic subtracts people who are leaving the dct
        
        takeout: int
            The current number of takeout leaving
        dinein: int
            The current number of dinein leaving
        returns: 
            self.takeout_capacity, self.dinein_capacity, self.total_capacity
    """
    def outgoing_dct_traffic(self, takeout: int, dinein: int):
        self.takeout_capacity = max(self.takeout_capacity - takeout, 0)
        self.dinein_capacity = max(self.dinein_capacity - dinein, 0)
        outgoingtraffic = takeout + dinein
        self.total_capacity = max(self.total_capacity - outgoingtraffic, 0)
        return self.takeout_capacity, self.dinein_capacity, self.total_capacity
