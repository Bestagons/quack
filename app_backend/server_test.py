import server
from fastapi.testclient import TestClient
from pydantic import BaseModel

client = TestClient(server.app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "This is the App Backend!"}

def test_getuser():
    response = client.get("/login/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the login page!"}

def test_registeruser():
    print("test registeruser _____________________________________")
    # user login model with username, email, and password
    class UserLogin(BaseModel):
        username: str
        email: str
        password: str

    login = UserLogin
    print("login testing: ", login)
    response = client.post("/register/")
    # assert response.status_code == 201
    # assert response.status_code == 400
    # assert response.json() == {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}
    # assert response.json() == {"err" : "Invalid email address. It must be an emory.edu email."}
    # assert response.json() == {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}
    # assert response.json() == {"msg": "Successfully registered new user."}

    