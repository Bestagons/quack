from bson import ObjectId
from pydantic import BaseModel, Field
from typing import List
from database import db

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
    _id = None
    name: str = ''
    email: str = ''
    password: str = ''
    devices: List[str] = []
    friends: List[str] = []
    favorites: List[str] = []
    is_sharing_location: bool = False
    loc: int = 0

    def get_user_by_id(self, _id):
        if isinstance(_id, str):
            _id = ObjectId(_id)
        # Return the user with the given id as a User object
        user_dict = db.db.users.find_one({"_id": _id})
        # convert to user object
        user = User(**user_dict)
        return user

    def get_user_by_email(self, email):
        user_dict = db.db.users.find_one({"email": email})
        user = User(**user_dict)
        return user

    def save(self):
        db.db.users.update_one({"_id": self._id}, {"$set": self.dict()}, upsert=True)
