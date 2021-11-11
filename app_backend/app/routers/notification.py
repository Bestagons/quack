from fastapi import APIRouter, Response, status
from pydantic import BaseModel

router = APIRouter(prefix="/notification")

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
    resp.status = status.HTTP_200_OK
    resp.body = {"msg": "Device added successfully"}
    return resp
