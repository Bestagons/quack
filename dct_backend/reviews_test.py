from fastapi import status
from fastapi.testclient import TestClient
from server import app
from reviews import Reviews


def test_review():
    # testing to make sure food names are entered in lowercase

    client = TestClient(app)

    class Params():
        def __init__(self, food, rating, msg, email):
            self.food = food
            self.rating = rating
            self.msg = msg
            self.email = email

        def to_json(self):
            return {"food_name": self.food, "rating": self.rating, "review": self.msg, "email": self.email}

    class ReviewTest():
        def __init__(self, review: Params, expect_status: int, expects_err: bool):
            self.review = review.to_json()
            self.expects_status = expect_status
            self.expects_err = expects_err  # true or false

    test_cases = [
        ReviewTest(Params("mac and cheese", 4, "really liked it", "mimi@emory.edu"), status.HTTP_201_CREATED, False), # correct format (all lower case)
        ReviewTest(Params("MAC AND CHEESE", 4, "really liked it", "mimi@emory.edu"), status.HTTP_400_BAD_REQUEST, True),
        ReviewTest(Params("Mac and Cheese", 4, "really liked it", "mimi@emory.edu"), status.HTTP_400_BAD_REQUEST, True)
    ]
    for test_case in test_cases:
        payload = test_case.review
        payload["dry_run"] = True
        print("Testing: " + test_case.review["food_name"])
        response = client.post("/reviews/review", json=payload)
        assert response.status_code == test_case.expects_status
        assert ("err" in response.json()) == test_case.expects_err
