from fastapi import FastAPI, Response, status
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from dotenv import load_dotenv
from auth_bearer import JWTBearer
from auth_handler import signJWT

import re
import os

from database import Database

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()
print("Starting server...")
app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

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
@app.post("/new-friend", status_code=status.HTTP_201_CREATED)
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
class User(BaseModel):
    name: str
    email: str
    password: str


"""
    login implements the route /login/

    login: User
        The UserLogin model that includes the username, email, and password
    resp: Response
        The response to send back to the user which contains the status code and body
    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@app.post("/login")
async def login(login: User, resp: Response):
    name = login.name
    email = login.email
    password = login.password

    user = {
        "name": name,
        "email": email,
        "password": password
    }

    db_user = db.get_user(user)

    if db_user is None:
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "This user does not exist. Please try different credentials."}
        
    return {"msg": "Successfully logged in"}, signJWT(user["email"])

"""
    registeruser implements the /register/ route

    login: User
        The UserLogin model that includes the username, email, and password
    resp: Response
        The response to send back to the user which contains the status code and body
    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@app.post("/register", status_code=status.HTTP_201_CREATED)
async def register(login: User, resp: Response):

    name = login.name
    email = login.email
    password = login.password

    # params are it must end with @emory.edu
    validEmail = r'\b[A-Za-z0-9._%+-]+@emory.edu\b'
    # valid password is the regular expression of the valid format the password should be
    # params are 8 to 20 character length, contain one upper case, one lower case, and one digit
    validPassword = r'^(?=.*[\d])(?=.*[A-Z])(?=.*[a-z])[\w\d@#$]{8,20}'

    if name.strip() == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid name. Cannot be empty."}

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
        "name": name,
        "email": email,
        "password": password
    }

    msg = db.save_user_in_db(new_user)
    if "err" in msg:
        resp.status_code = status.HTTP_400_BAD_REQUEST
    else:
        return msg, signJWT(new_user["email"])

    return msg

