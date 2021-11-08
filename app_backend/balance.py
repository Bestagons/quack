class BalanceTracker():
    def __init__(self, uuid: str, dooley_dollars: float, meal_swipes: int):
        self.uuid = uuid  # will change to user ID after future refactoring and development
        self.meal_swipes = meal_swipes  # Meal swipe quanity
        self.dooley_dollars = dooley_dollars  # Dooley Dollar Balance
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
        return: True or False (whether operation succeeds or fails)
        """
        if (spent <= 0 ): # Error (negative values and 0)
            return False
        if (spent <= self.dooley_dollars): # No error (possible value)
            self.dooley_dollars = self.dooley_dollars - spent
            return True
        elif (spent > self.dooley_dollars): # Error (impossible value)
            return False


    def mealswipe_sub(self):
        """
        Takes no params -- decrements when called
        return: True or False (whether operation succeeds or fails)
        """
        if (self.meal_swipes > 0):
            self.meal_swipes = self.meal_swipes - 1
            return True
        if (self.meal_swipes <= 0): # Should never be negative
            return False

    # ------------ Incrementing Balances (for deposit) -------------

    def dooley_add(self, additional: float):

        """
        additional: The amount of extra dooley dollars added
        return: True or False (whether operation succeeds or fails)
        """
        if (additional <= 0): # Error (negative values and 0)
            return False
        elif(additional > 0):
            self.dooley_dollars = self.dooley_dollars + additional
            return True

    def mealswipe_add(self, additional: int):
        """
        additional: The amount of extra swipes added
        return: True or False (whether operation succeeds or fails)
        """
        if (additional <= 0 ):# Error (negative values and 0)
            return False
        elif (additional > 0 ):
            self.meal_swipes = self.meal_swipes + additional
            return True

