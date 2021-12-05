from pydantic import BaseModel
from dotenv import load_dotenv
from fastapi import APIRouter, status, Response
import re
import json
from bson import BSON
from bson import json_util, ObjectId
import bcrypt

from app.auth_handler import signJWT
from database import db
from models.user import User

from ..models.user_models import UserLogin, UserRegister

router = APIRouter(prefix="/user")


"""
    login implements the route /login/

    login: User
        The UserLogin model that includes the username, email, and password
    resp: Response
        The response to send back to the user which contains the status code and body
    returns Response, JWT Token
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
        JWT Token
            The token required to access specific routes
"""
@router.post("/login")
async def login(login: UserLogin, resp: Response):
    email = login.email
    password = login.password

    # get user with email
    user = db.get_user_by_email(email, display_password=True)

    # check if user exists
    if user is None:
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid email or password."}

    # check if password is correct
    try:
        if user['password'] != password and not bcrypt.checkpw(password.encode('utf-8'), user['password']):
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "Invalid email or password."}
    except TypeError:
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid email or password."}

    # if db_user is None:
    #     resp.status_code = status.HTTP_400_BAD_REQUEST
    #     return {"err": "This user does not exist. Please try different credentials."}, {}, None

    user["_id"] = str(user['_id'])

    # drop password from user
    user.pop("password")

    return {"msg": "Successfully logged in"}, signJWT(user['_id'], email), \
           json.dumps(user, sort_keys=True, indent=4, default=json_util.default)

"""
    register implements the /register/ route

    login: User
        The UserLogin model that includes the username, email, and password
    resp: Response
        The response to send back to the user which contains the status code and body
    returns Response, JWT Token
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
        JWT Token
            The token required to access specific routes
"""
@router.post("/register", status_code=status.HTTP_201_CREATED)
async def register(login: UserRegister, resp: Response):
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
        return {"err": "Invalid email address. It must be an emory.edu email."}

    # check if password is a valid password
    if not (re.search(validPassword, password)):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid password. It must be 8 to 20 characters and have at least one upper case letter, one lower case letter, and one digit."}

    # hash the password
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())

    # adds user to the database
    new_user = {
        "name": name,
        "email": email,
        "password": hashed_password
    }

    msg = db.save_user_in_db(new_user)
    if "err" in msg:
        resp.status_code = status.HTTP_400_BAD_REQUEST
    else:
        return signJWT(msg, email)

    return msg

