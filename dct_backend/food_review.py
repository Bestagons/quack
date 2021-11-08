from food_item import FoodItem

class FoodReview ():
    """
    uuid: str
        user id information

    fooditem: FoodItem
        FoodItem being reviewed

    review: str
        writen review

    rating: int
        1-5 star rating of FoodItem

    """
    def __init__(self, uuid: str, fooditem: FoodItem, review: str, rating: int):
        self.uuid = uuid
        self.fooditem = fooditem
        # self.rating = rating
        # self.review = review

    # SETTERS:
    def set_review(self, review: str):
        """
        Sets review and allows user to update existing review
        :param review: users written review of food
        :return: True or False for Error Handling
        """
        if len(review) == 0:
            return False
        else:
            self.review = review
            return True

    def delete_review(self):
        """
        Deletes an existing review
        :return: True or False for Error Handling
        """

        if self.review == None:
            return False # no review
        else:
            self.review = None
            return True

    def set_rating(self, rating: int):
        """
        set / change star rating of food item
        :param rating: 1 - 5
        :return: True or False for Error Handling
        """
        if rating <= 0 or rating > 5:
            return False
        else:
            self.rating = rating
            return True
    # GETTERS:
    def get_review(self):
        return self.review
    def get_rating(self):
        return self.rating
