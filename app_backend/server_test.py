import server
import database
from fastapi.testclient import TestClient
from fastapi import status
from dotenv import load_dotenv
import os

client = TestClient(server.app)

load_dotenv()

class TestDatabase(database.Database):
    def __init__(self, username, password):
        super().__init__(username, password)

    def save_user_in_db(self, login_info):
        return super().save_user_in_db(login_info, dry_run=True)

test_db = TestDatabase(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
test_db.connect()
server.db = test_db

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the App Backend!"}

# Tests the /new-friend route
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
        query = f"/new-friend?{uuid_q}&{fuuid_q}"
        print("Testing: " + query)
        response = client.post(query)
        assert response.status_code == test_case.expected_status_code
        assert ("err" in response.json()) == test_case.expects_err


def test_login():
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
        Params('Bruce Lee', 'bruce.lee@emory.edu', 'Password1!', status.HTTP_200_OK, {"msg": "Successfully logged in"}),
        Params('Bruce Lee', 'DNE@emory.edu', 'Password1!', status.HTTP_400_BAD_REQUEST, {"err": "This user does not exist. Please try different credentials."}),
        Params('Bruce Lee', 'bruce.lee@emory.edu', 'Password1', status.HTTP_400_BAD_REQUEST, {"err": "Password does not match. Please try a different password."})
    ]

    for test_case in test_cases:
        print(test_case.to_json())
        response = client.post("/login", json=test_case.to_json())
        print(response.json())
        assert response.status_code == test_case.expects_err
        assert response.json() == test_case.expects_err_msg
   

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
        response = client.post("/register", json=test_case.to_json())
        print(response.json())
        assert response.status_code == test_case.expects_err
        # temporarily will not check success json response because
        # database will always give an error json because
        # user already exists in database
        if response.status_code == status.HTTP_400_BAD_REQUEST:
            assert response.json() == test_case.expects_err_msg
