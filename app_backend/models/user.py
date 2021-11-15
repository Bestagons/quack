from pydantic import BaseModel

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
    devices: list
