from app.app import app
from fastapi.testclient import TestClient
from fastapi import status

client = TestClient(app)


def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the App Backend!"}


def test_new_friend():
    class Params():
        def __init__(self, uuid: str, fuuid: str, expected_status_code: int, expects_err: bool):
            self.uuid = uuid
            self.fuuid = fuuid
            self.expected_status_code = expected_status_code
            self.expects_err = expects_err

    test_cases = [Params("", "", status.HTTP_400_BAD_REQUEST, True),
                  Params(None, None, status.HTTP_400_BAD_REQUEST, True),
                  Params("uuid1", "uuid1", status.HTTP_406_NOT_ACCEPTABLE, True),
                  Params("uuid1", "test_uuid", status.HTTP_412_PRECONDITION_FAILED, True),
                  Params("uuid1", "uuid2", status.HTTP_201_CREATED, False)]

    for test_case in test_cases:
        uuid_q = f"uuid={test_case.uuid}" if test_case.uuid is not None else ""
        fuuid_q = f"fuuid={test_case.fuuid}" if test_case.fuuid is not None else ""
        query = f"/friends/new-friend/?{uuid_q}&{fuuid_q}"
        print("Testing: " + query)
        response = client.post(query)
        assert response.status_code == test_case.expected_status_code
        assert ("err" in response.json()) == test_case.expects_err


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
                  Params("food_id1", 0, status.HTTP_412_PRECONDITION_FAILED, True),
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