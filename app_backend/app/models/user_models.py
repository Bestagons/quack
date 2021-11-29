from pydantic import BaseModel


class User(BaseModel):
    name: str
    email: str
    password: str
    friends: list
    favorite_foods: list

class UUID(BaseModel):
    _id: str

class AddFriend(BaseModel):
    friend_email: str
