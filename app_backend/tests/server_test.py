from app.app import app
from fastapi.testclient import TestClient
from fastapi import status

client = TestClient(app)


def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the App Backend!"}

def test_getuser():
    response = client.get("/friends/login/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the login page!"}

def test_registeruser():
    class Params:
        def __init__(self, username: str, email: str, password: str, expects_err: bool, expects_err_msg: dict):
            self.username = username
            self.email = email
            self.password = password
            self.expects_err = expects_err
            self.expects_err_msg = expects_err_msg
        def to_json(self):
            return {"username": self.username, "email": self.email, "password": self.password}
    test_cases = [
        Params('test000', 'test0@emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}),
        Params('test0000', 'test0@gmail.com', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
        Params('test0000', 'test0@emory.edu', 'test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
        Params('', 'test0@emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}),
        Params('test0000', '', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
        Params('test0000', 'test0@emory.edu', '', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
        Params('TEST@123', 'test0@emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}),
        Params('test0000', 'test.emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
        Params('test0000', 'test0@emory.edu', 'TEST@123', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
        Params('test0000', 'test@emory.edu', 'Test0000', status.HTTP_201_CREATED, {"msg": "Successfully registered new user."})
    ]

    for test_case in test_cases:
        response = client.post("/friends/register/", json=test_case.to_json())
        assert response.status_code == test_case.expects_err
        # temporarily will not check success json response because
        # database will always give an error json because
        # user already exists in database
        if response.status_code == status.HTTP_400_BAD_REQUEST:
            assert response.json() == test_case.expects_err_msg
