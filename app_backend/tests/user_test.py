from app.app import app
import database
from fastapi.testclient import TestClient
from fastapi import status
from dotenv import load_dotenv
import os

client = TestClient(app)

def test_login():
    class Params:
        def __init__(self, name: str, email: str, password: str, expects_code, expects_err: bool):
            self.name = name
            self.email = email
            self.password = password
            self.expects_code = expects_code
            self.expects_err= expects_err
        def to_json(self):
            return {"name": self.name, "email": self.email, "password": self.password}

    test_cases = [
        Params('Bruce Lee', 'bruce.lee@emory.edu', 'Password1!', status.HTTP_200_OK, False),
        Params('Bruce Lee', 'DNE@emory.edu', 'Password1!', status.HTTP_400_BAD_REQUEST, True),
        Params('Bruce Lee', 'bruce.lee@emory.edu', 'Password1', status.HTTP_400_BAD_REQUEST, True)
    ]

    for test_case in test_cases:
        response = client.post("user/login", json=test_case.to_json())
        msg = response.json()
        print(msg)
        assert response.status_code == test_case.expects_code
        assert ("err" in msg) == test_case.expects_err


def test_register():
    class Params:
        def __init__(self, name: str, email: str, password: str, expects_err: bool, expects_err_msg: dict):
            self.name = name
            self.email = email
            self.password = password
            self.expects_err = expects_err
            self.expects_err_msg = expects_err_msg
        def to_json(self):
            return {"name": self.name, "email": self.email, "password": self.password}
    test_cases = [
        Params('test000', 'test0@emory.edu', 'Test0000', status.HTTP_201_CREATED, {"msg": "Successfully registered new user."}),
        Params('test0000', 'test0@gmail.com', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
        Params('test0000', 'test0@emory.edu', 'test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
        Params('', 'test0@emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid name. Cannot be empty."}),
        Params('test0000', '', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
        Params('test0000', 'test0@emory.edu', '', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
        Params('Test. 500', 'test.emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
        Params('test0000', 'test0@emory.edu', 'TEST@123', status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
        Params('User Test', 'test@emory.edu', 'Test0000', status.HTTP_400_BAD_REQUEST, {"err": "Email already exists. Use a different email."}),
        Params('Test User', 'unique@emory.edu', 'Test0000', status.HTTP_201_CREATED, {"msg": "Successfully registered new user."})
    ]

    for test_case in test_cases:
        print(test_case.to_json())
        response = client.post("/user/register", json=test_case.to_json())
        print(response.json())
        assert response.status_code == test_case.expects_err
        # temporarily will not check success json response because
        # database will always give an error json because
        # user already exists in database
        if response.status_code == status.HTTP_400_BAD_REQUEST:
            assert response.json() == test_case.expects_err_msg
