class FoodItem():
    """
        FoodItem keeps track of information for each food item

        name: str
            The name of the food item

        station: str
            The station that the food item can be found in

        meal_time: str
            The meal time the food item will be served

        calories: int
            The amount of calories the food item has

        category: list
            The categories the food item matches
    """
    def __init__(self, name: str, station: str, meal_time: str, calories: int, categories: list):
        self.name = name
        self.station = station
        self.meal_time = meal_time
        self.calories = calories
        self.categories = categories
