class Capacity():
    """
        Capacity keeps track of the takeout and dinein
        takeout: int
            The current number of takeout
        dinein: int
            The current number of dinein
        totalcapacity: int
            The current total capacity of takeout + dinein
    """
    def __init__(self, takeout: int, dinein: int, totalcapacity: int):
        self.takeout = takeout
        self.dinein = dinein
        self.totalcapacity = totalcapacity