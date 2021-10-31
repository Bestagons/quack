from user import User


class BalanceTracker(User):
    def __init__(self, name: str, dooley_dollars: float, meal_swipes: int):
        super().__init__(name, dooley_dollars, meal_swipes)
        """

        name: str
            The name of the user

        dooley_dollars: float
            The current balance of dooley dollars

        meal_swipes: int
            The current amount of remaining meal swipes

        """

    # ------------ Decrementing Balances (for spending) -------------

    def dooley_sub(self, spent: float):
        """
        spent: The amount of dooley dollars spent
        return: The updated Balance Tracker object
        """
        if (abs(spent) <= self.dooley_dollars):
            self.dooley_dollars = self.dooley_dollars - abs(spent)
        elif (abs(spent) > self.dooley_dollars): # else if
            self.dooley_dollars = 0
        return self

    def mealswipe_sub(self):
        """
        Takes no params -- decrements when called
        return: The updated Balance Tracker object
        """
        if (self.meal_swipes > 0):
            self.meal_swipes = self.meal_swipes - 1
        return self

    # ------------ Incrementing Balances (for deposit) -------------

    def dooley_add(self, additional):

        """
        additional: The amount of extra dooley dollars added
        return: The updated Balance Tracker object
        """
        self.dooley_dollars = self.dooley_dollars + abs(additional)
        return self

    def mealswipe_add(self, additional):
        """
        additional: The amount of extra swipes added
        return: The updated Balance Tracker object
        """
        self.meal_swipes = self.meal_swipes + abs(additional)
        return self

