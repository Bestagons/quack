from app.app import app
from fastapi.testclient import TestClient
from fastapi import status

client = TestClient(app)


def test_toggle_favorite():
    class Params:
        def __init__(self, food_id: str, state: int, expected_status_code: int, expects_err: bool):
            self.food_id = food_id
            self.state = state
            self.expected_status_code = expected_status_code
            self.expects_err = expects_err

    test_cases = [Params("", 0, status.HTTP_400_BAD_REQUEST, True),
                  Params("food_id1", 2, status.HTTP_400_BAD_REQUEST, True),
                  Params("food_id1", -1, status.HTTP_400_BAD_REQUEST, True),
                  Params("food_id1", 0, status.HTTP_200_OK, False),
                  Params("food_id1", 1, status.HTTP_200_OK, False)]

    for test_case in test_cases:
        response = client.post(
            "/favorites/toggle-favorite/",
            json={"food_id": test_case.food_id, "state": test_case.state},
        )
        print("Testing: " + response.url + " with food_id: " + test_case.food_id +
              " and food_state: " + str(test_case.state))
        print(f"Response: {response.json()}")
        assert response.status_code == test_case.expected_status_code
        assert ("err" in response.json()) == test_case.expects_err