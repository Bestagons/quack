from fastapi import FastAPI, Response, status
from dotenv import load_dotenv
import os
from database import Database
from pydantic import BaseModel
import re
import pymongo

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()
print("Starting server...")
app = FastAPI()

@app.get("/")
async def root():
    return {"msg": "This is the App Backend!"}


"""
    add_friend implements the /new-friend route

    resp: Response
        The response to send back to the user which contains the status code and body

    uuid: str
        The UUID of the user who is adding the new friend

    fuuid: str
        The UUID of the friend to be added

    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@app.post("/new-friend/", status_code=status.HTTP_201_CREATED)
async def add_friend(resp: Response, uuid: str = None, fuuid: str = None):
    # check if the uuid exists
    if uuid is None or not isinstance(uuid, str) or uuid == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid UUID"}
    if fuuid is None or not isinstance(fuuid, str) or fuuid == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid Friend UUID"}

    # check if the uuid does not already contain fuuid
    if uuid == fuuid:
        resp.status_code = status.HTTP_406_NOT_ACCEPTABLE
        return {"err" : "Invalid combination of UUIDs"}

    uuid_friends = ["test_uuid"]  # TODO: get uuid's friends here
    if fuuid in uuid_friends:
        resp.status_code = status.HTTP_412_PRECONDITION_FAILED
        return {"err" : "FUUID already linked to UUID"}

    # add fuuid
    uuid_friends.append(fuuid)
    return {"msg" : "FUUID has been successfully linked to UUID"}

"""
    UserLogin model keeps track of the user login information
    username: str
        The username of the user
    email: str
        The email of the user
    password: str
        The password of the user
"""
class UserLogin(BaseModel):
    username: str
    email: str
    password: str


"""
    getuser implements the route /login/
    returns message
"""
# TODO: Once attached to database will be able to retreive
# specific user information and to log them in
@app.get("/login/")
async def getuser():
    return {"msg": "This is the login page!"}


"""
    registeruser implements the /register/ route
    login: UserLogin
        The UserLogin model that includes the username, email, and password
    resp: Response
        The response to send back to the user which contains the status code and body
    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request        
"""
@app.post("/register/", status_code=status.HTTP_201_CREATED)
async def registeruser(login: UserLogin, resp: Response):
    user_db = db.client["user"]
    userinfo_collection = user_db["userlogininfo"]

    username = login.username
    email = login.email
    password = login.password

    validUsername = r'^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$'
    validEmail = r'\b[A-Za-z0-9._%+-]+@emory.edu\b'
    validPassword = r'^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])[\w\d@#$]{8,20}'

    # check if email already exists in database
    for eml in userinfo_collection.find({}, {"_id": 0, "username": 0, "password": 0}):
        if email == eml['email']:
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err" : "Email already exists. Use a different email."}

    # check if username is a valid username
    if not (re.search(validUsername, username)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid username. It must be 8 to 20 characters with no special characters."}

    # check if email is a valid emory email
    if not (re.search(validEmail, email)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid email address. It must be an emory.edu email."}

    # check if password is a valid password
    if not (re.search(validPassword, password)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}

    # adds user to the database
    new_user = {
        "username": username,
        "email": email,
        "password": password
    }

    userinfo_collection.insert_one(new_user)

    return {"msg": "Successfully registered new user."}

