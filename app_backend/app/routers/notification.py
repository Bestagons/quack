from fastapi import APIRouter, Response, status, Depends, Security
from ..auth_bearer import JWTBearer
from fastapi.security import HTTPAuthorizationCredentials
from database import db
from models.user import User
from app.auth_handler import decodeJWT

router = APIRouter(prefix="/notification")

security = JWTBearer()

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
@router.post("/add_device", dependencies=[Depends(security)])
async def add_device(resp: Response, device_code: str, token: HTTPAuthorizationCredentials = Security(security)):
    payload: dict = decodeJWT(token)
    user_id = payload["user_id"]
    user: User = User().get_user_by_id(user_id)

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
    remove_device removes a bind device from a user

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
async def remove_device(resp: Response, device_code: str, token: HTTPAuthorizationCredentials = Security(security)):
    payload: dict = decodeJWT(token)
    user_id = payload["user_id"]
    user: User = User().get_user_by_id(user_id)

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
