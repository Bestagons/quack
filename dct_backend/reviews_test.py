# from reviews import Reviews
# from fastapi import APIRouter, Response, status
# import reviews
# import asyncio
#
#
# class ReviewTest():
#     def __init__(self, food_name: str, rating: int,
#                  review: str, username: str, test: bool):
#         self.food_name = food_name
#         self.rating = rating
#         self. review = review
#         self.username = username
#         self.test = test  # true or false
#
# def test_food_name():
#     # # testing to make sure food names are entered in lowercase
#     test_cases = [
#         ("mac and cheese", 4, "really liked it", "mimi", True), # correct format (all lower case)
#         ("MAC AND CHEESE", 4, "really liked it", "mimi", False),
#         ("Mac and Cheese", 4, "really liked it", "mimi", False)
#     ]
#     for test_case in test_cases:
#         tester = ReviewTest(test_case[0],test_case[1], test_case[2], test_case[3],test_case[4])
#         tester2 = Reviews(food_name=test_case[0], rating=test_case[1],
#                           review=test_case[2], username=test_case[3])
#
#         co_routine = reviews.save_review_in_db(Response ,tester2,True)
#         test_check = asyncio.run(co_routine)
#         assert test_check == tester.test
