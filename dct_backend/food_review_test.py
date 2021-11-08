from food_review import FoodReview
from food_item import FoodItem
import food_item_test

class ReviewTest():
    def __init__(self, fooditem:FoodItem, review: str, rating: int, test: bool):
        self.fooditem = FoodItem
        self.review = review
        self.rating = rating
        self.test = test  # true or false

def test_set_get_review():
    # ----------- set/get rating Test -------------
    fooditem_default = FoodItem("test_name", "station_name", "meal_time", 100, ["category1", "category5"])
    uuid_default = "uuid"
    test_cases_rating = [
        ("review number 1", 0, False),
        ("review number 2", 1, True),
        ("review number 3", 2, True),
        ("review number 4", 3, True),
        ("review number 5", 4, True),
        ("review number 6", 5, True),
        ("review number 7", 6, False),
    ]

    for test_case in test_cases_rating:
        tester = ReviewTest(fooditem_default, test_case[0],test_case[1], test_case[2])
        tester1 = FoodReview(uuid_default,fooditem_default, test_case[0],test_case[1])
        assert tester1.review == None
        assert tester1.rating == None

        test = tester1.set_rating(test_case[1])
        assert test == tester.test
        if test != False:
            assert tester1.get_rating() == test_case[1]

 # ------------ set/get review Test --------------

    fooditem_default = FoodItem("test_name", "station_name", "meal_time", 100, ["category1", "category5"])
    uuid_default = "uuid"
    test_cases_review = [
        ("", 1, False),
        ("review number 1", 1, True),
        ("review number 2", 2, True),
        ("review number 3", 3, True),
    ]
    for test_case in test_cases_review:
        tester = ReviewTest(fooditem_default, test_case[0],test_case[1], test_case[2])
        tester1 = FoodReview(uuid_default,fooditem_default, test_case[0],test_case[1])
        assert tester1.review == None
        assert tester1.rating == None

        test = tester1.set_review(test_case[0])
        assert test == tester.test
        if test != False:
            assert tester1.get_review() == test_case[0]
