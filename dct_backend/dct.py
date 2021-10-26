from food_station import FoodStation

class DCT():
    def __init__(self):
        self.menu = []
        self.stations = []

    """
        save_food_station adds a food station to the list of stations

        name: str
            The name of the food station
        
        returns: FoodStation
            The food station that was added to the list of food stations
    """
    def save_food_station(self, name: str) -> FoodStation:
        station = FoodStation(name)
        self.stations.append(station)
        return station
