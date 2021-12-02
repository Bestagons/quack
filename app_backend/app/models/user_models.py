from pydantic import BaseModel


class User(BaseModel):
    name: str
    email: str
    password: str
    friends: list
    favorite_foods: list


class UserLogin(BaseModel):
    email: str
    password: str


class UserRegister(BaseModel):
    name: str
    email: str
    password: str


class UUID(BaseModel):
    _id: str


class AddFriend(BaseModel):
    friend_email: str


class SaveSeating(BaseModel):
    section: int
    is_sharing_loc: bool

