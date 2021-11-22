from app.app import app
from fastapi.testclient import TestClient
from fastapi import status


client = TestClient(app)


def test_new_friend():
    class Params():
        def __init__(self, friend_email: str, expected_status_code: int, expects_err: bool):
            self.friend_email = friend_email
            self.expected_status_code = expected_status_code
            self.expects_err = expects_err

    test_cases = [Params("", status.HTTP_400_BAD_REQUEST, True),
                  Params(None, status.HTTP_422_UNPROCESSABLE_ENTITY, True),
                  Params("test.friend@emory.edu", status.HTTP_412_PRECONDITION_FAILED, True),
                  Params("new.friend@emory.edu", status.HTTP_201_CREATED, False)]

    for test_case in test_cases:
        payload = dict()
        if test_case.friend_email is not None:
            payload["friend_email"] = test_case.friend_email
        query = f"/friends/new-friend/"
        print("Testing: " + payload.__str__())
        response = client.post(query, json=payload)
        assert response.status_code == test_case.expected_status_code
        assert ("err" in response.json() or 'detail' in response.json()) == test_case.expects_err
