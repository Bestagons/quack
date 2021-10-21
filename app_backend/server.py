from fastapi import FastAPI
from fastapi import FastAPI, Response, status
from pydantic import BaseModel
import re

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "This is the App Backend!"}

# login section
# user login model with username, email, and password
class UserLogin(BaseModel):
    username: str
    email: str
    password: str
    
# TODO: Once attached to database will be able to retreive
# specific user information and to log them in
@app.get("/login/")
async def getuser():
    return {"msg": "This is the login page!"}

# register a user
# TODO: Once attached to database will be able to add user
@app.post("/register/", status_code=status.HTTP_201_CREATED)
async def registeruser(login: UserLogin, resp: Response):
    validUsername = r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$'
    validEmail = r'\b[A-Za-z0-9._%+-]+@emory.edu\b'
    validPassword = r'^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])[\w\d@#$]{8,20}'

    # TODO: check if username already exists in database
    
    # check if username is a valid username
    if not (re.search(validUsername, login.username)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}
    
    # check if email is a valid emory email
    if not (re.search(validEmail, login.email)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid email address. It must be an emory.edu email."}
    
    # check if password is a valid password
    if not (re.search(validPassword, login.password)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}

    # TODO: register user and add them to the database
    username = login.username
    email = login.email
    password = login.password.encode("utf-8")
    return {"msg": "Successfully registered new user."}
