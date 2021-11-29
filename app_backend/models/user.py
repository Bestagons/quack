from bson import ObjectId
from pydantic import BaseModel, Field
from typing import List
from database import db


class PyObjectId(ObjectId):
    @classmethod
    def __get_validators__(cls):
        yield cls.validate
    @classmethod
    def validate(cls, v):
        if not ObjectId.is_valid(v):
            raise ValueError("Invalid objectid")
        return ObjectId(v)
    @classmethod
    def __modify_schema__(cls, field_schema):
        field_schema.update(type="string")


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
    id: PyObjectId = Field(default_factory=PyObjectId, alias="_id")
    name: str = ''
    email: str = ''
    password: str = ''
    devices: List[str] = []
    friends: List[str] = []
    favorites: List[str] = []
    is_sharing_location: bool = False

    def get_user_by_id(self, _id):
        if isinstance(_id, str):
            _id = ObjectId(_id)
        # Return the user with the given id as a User object
        user_dict = db.db.users.find_one({"_id": _id})
        # convert to user object
        user = User(**user_dict)
        return user

    def get_user_by_email(self, email):
        return db.db.users.find_one({"email": email})

    def save(self):
        db.db.users.update_one({"_id": self.id}, {"$set": self.dict()}, upsert=True)
