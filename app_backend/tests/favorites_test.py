from app.app import app
from fastapi.testclient import TestClient
from fastapi import status
from .authenticate_test import authenticate_test

client = TestClient(app)


def test_toggle_favorite():
    token = authenticate_test()

    class Params:
        def __init__(self, food_name: str, state: bool, expected_status_code: int, expects_err: bool):
            self.food_name = food_name
            self.state = state
            self.expected_status_code = expected_status_code
            self.expects_err = expects_err

    test_cases = [Params("", True, status.HTTP_400_BAD_REQUEST, True),
                  Params("Milkshakes", True, status.HTTP_200_OK, False),
                  Params("milkshakes", False, status.HTTP_200_OK, False)]

    for test_case in test_cases:
        response = client.post(
            "/favorites/toggle-favorite/",
            headers={"Authorization": f"Bearer {token}", "Accept": "application/json"},
            json={"food_name": test_case.food_name, "state": test_case.state},
        )
        print("Testing: " + response.url + " with food_id: " + test_case.food_name +
              " and food_state: " + str(test_case.state))
        print(f"Response: {response.json()}")
        assert response.status_code == test_case.expected_status_code
        assert ("err" in response.json()) == test_case.expects_err
