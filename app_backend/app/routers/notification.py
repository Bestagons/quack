from fastapi import APIRouter, Response, status
from pydantic import BaseModel
from database import Database
from dotenv import load_dotenv
import os
from models.user import User

router = APIRouter(prefix="/notification")

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()

"""
    add_device binds a device to a user

    resp: Response
        The response to send back to the user which contains the status code and body

    device_code: str
        The UUID of the friend to be added

    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@router.post("/add_device")
async def add_device(resp: Response, device_code: str):
    user = User()  # Todo: Get User from JWT
    # Add the device to the user
    devices = user.devices
    if devices is None:
        devices = [device_code]
    elif device_code in devices:  # Allows multiple add.
        resp.body = {"msg": "Device already added"}
        return resp
    else:
        devices.append(device_code)
    # Update the user
    db.db["users"].update_one({"_id": user.id}, {"$set": {"devices": devices}})

    resp.status = status.HTTP_200_OK
    resp.body = {"msg": "Device added successfully"}
    return resp


"""
    add_device binds a device to a user

    resp: Response
        The response to send back to the user which contains the status code and body

    device_code: str
        The UUID of the friend to be added

    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@router.post("/remove_device")
async def add_device(resp: Response, device_code: str):
    user = User()  # Todo: Get User from JWT
    # Add the device to the user
    devices = user.devices
    if devices is None or device_code not in devices:
        resp.body = {"msg": "Device not found"}
        return resp
    else:
        devices.remove(device_code)
    # Update the user
    db.db["users"].update_one({"_id": user.id}, {"$set": {"devices": devices}})

    resp.status = status.HTTP_200_OK
    resp.body = {"msg": "Device removed successfully"}
    return resp
