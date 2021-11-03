from fastapi import FastAPI, Response, status
from dotenv import load_dotenv
import os
from database import Database

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()
user_db = db.client["user"]
userinfo_collection = user_db["userlogininfo"]
resp = Response

class User():
    def save_user_in_db(loginInfo: dict):
        for eml in userinfo_collection.find({}, {"_id": 0, "username": 0, "password": 0}):
            if loginInfo['email'] == eml['email']:
                resp.status_code = status.HTTP_400_BAD_REQUEST
                return {"err" : "Email already exists. Use a different email."}
        userinfo_collection.insert_one(loginInfo)
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Successfully registered new user."}
