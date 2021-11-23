from app.app import app
from fastapi.testclient import TestClient
from fastapi import status
from .authenticate_test import authenticate_test


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

def test_get_friends():
    class Params:
        def __init__(self, token: str, expected_status_code: int, expects_err: bool):
            self.token = token
            self.expected_status_code = expected_status_code
            self.expects_err = expects_err

    token = authenticate_test()
    assert isinstance(token, dict)
    assert "access_token" in token.keys()
    token = token["access_token"]
    assert isinstance(token, str)
    assert token != ""

    test_cases = [Params(token, status.HTTP_200_OK, False)]

    for test_case in test_cases:
        query = "/friends/get-friends/"
        response = client.post(query, headers={"Authorization" : f"Bearer {test_case.token}", "Accept": "application/json"})
        assert ("err" in response.json()) == test_case.expects_err
        assert response.json() == "test"
        assert response.status_code == test_case.expected_status_code
