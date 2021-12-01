from sections import Sections
from dotenv import load_dotenv
import os
from database import Database
from app.models.user_models import SaveSeating
from models.user import User
from app.auth_bearer import JWTBearer
from app.auth_handler import decodeJWT
from fastapi import APIRouter, Response, status, Depends, Security
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer



router = APIRouter(prefix="/seating")
security = JWTBearer()
resp = Response




@router.post("/dct-seating-section", status_code=status.HTTP_201_CREATED)
async def set_seating_info(resp: Response, seating_info: SaveSeating,token: HTTPAuthorizationCredentials = Security(security), dry_run=False):
    """

    This function updates the object with the section number and respective color
     resp: Response
        The response to send back to the user which contains the status code and body

    Seating_info: SaveSeating
        The seating section number (based off of @BrendaCano 's Map)

    loc: int
        The section number associated with a user

    returns: Response

    """

    payload: dict = decodeJWT(token)
    user_id = payload["user_id"]
    user: User = User().get_user_by_id(user_id)

    # checks if location value is valid
    if seating_info.section == None: # no number specified
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "No seating section number specified"}

    if seating_info.section < 0 or seating_info.section > 9:# 0 for "None"
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid seating section number"}

    # override previous location
    user.loc = seating_info.section

    # check if location being shared
    if not dry_run and user.is_sharing_location == True:
        user.save()
    return {"msg": "Seating Section has been successfully linked to UUID"}

