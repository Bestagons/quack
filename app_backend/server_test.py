import server
from fastapi.testclient import TestClient
from fastapi import status
from pydantic import BaseModel

client = TestClient(server.app)

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
        query = f"/new-friend/?{uuid_q}&{fuuid_q}"
        print("Testing: " + query)
        response = client.post(query)
        assert response.status_code == test_case.expected_status_code
        assert ("err" in response.json()) == test_case.expects_err

def test_getuser():
    response = client.get("/login/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the login page!"}

def test_registeruser():
    # user login model with username, email, and password
    # class UserLogin(BaseModel):
    #     username: str
    #     email: str
    #     password: str
    
    class UserLogin:
        def __init__(self, username: str, email: str, password: str):
            self.username = username
            self.email = email
            self.password = password

    login = UserLogin('test000', 'test0@emory.edu', 'Test0000')
    response = client.post("/register/", login)
    assert response.status_code == status.HTTP_400_BAD_REQUEST
    assert response.json() == {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}

    # class UserLogin:
    #     def __init__(self, username: str, email: str, password: str):
    #         self.username = username
    #         self.email = email
    #         self.password = password

    # login_tests = [
    #         UserLogin('test000', 'test0@emory.edu', 'Test0000'),
    #         UserLogin('test0000', 'test0@gmail.com', 'Test0000'),
    #         UserLogin('test0000', 'test0@emory.edu', 'test0000'),
    #         UserLogin('test0000', 'test@emory.edu', 'Test0000')
    #     ]

    # class Params():
    #     def __init__(self, login: UserLogin, expected_status_code: int, expected_err_message: dict):
    #         self.login = login
    #         self.expected_status_code = expected_status_code
    #         self.expected_err_message = expected_err_message

    # test_cases = [
    #     Params(UserLogin('test000', 'test0@emory.edu', 'Test0000'), status.HTTP_400_BAD_REQUEST, {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}),
    #     Params(UserLogin('test0000', 'test0@gmail.com', 'Test0000'), status.HTTP_400_BAD_REQUEST, {"err" : "Invalid email address. It must be an emory.edu email."}),
    #     Params(UserLogin('test0000', 'test0@emory.edu', 'test0000'), status.HTTP_400_BAD_REQUEST, {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}),
    #     Params(UserLogin('test0000', 'test@emory.edu', 'Test0000'), status.HTTP_201_CREATED, {"msg": "Successfully registered new user."})
    # ]
    
    # for test_case in test_cases:
    #     login = test_case.login
    #     response = client.post("/register/", login)
    #     assert response.status_code == test_case.expected_status_code
    #     assert response.json() == test_case.expected_err_message
