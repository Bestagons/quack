class FoodItem():
    """
        FoodItem keeps track of information for each food item

        name: str
            The name of the food item
        station: str
            The station that the food item can be found in
        meal_time: str
            The meal time the food item will be served
        category: list
            The categories the food item matches
    """
    def __init__(self, name, station, meal_time, categories):
        self.name = name
        self.station = station
        self.meal_time = meal_time
        self.categories = categories
