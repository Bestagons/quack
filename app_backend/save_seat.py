from sections import Sections

from fastapi import APIRouter, Response, status
from dotenv import load_dotenv
import os
from database import Database
from pydantic import BaseModel
from sections import Sections
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from app.models.user_models import SaveSeating
from models.user import User
from app.auth_bearer import JWTBearer
from app.auth_handler import decodeJWT
from fastapi import APIRouter, Response, status, Depends, Security
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

#import server

load_dotenv()
db = Database(os.getenv('DB_USERNAME'), os.getenv('DB_PASSWORD'))
db.connect()


router = APIRouter(prefix="/seating")
security = JWTBearer()
resp = Response

seating_db = db.client["user"] # from user collection
seating_collection = seating_db["seating"] # review --> sub collection



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
    if seating_info.section == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "No seating section number specified"}

    if seating_info.section < 0 or seating_info.section > 9:# 0 for "None"
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid seating section number"}

    where_the_quack = seating_info.section

    # check if location being shared
    if user.is_sharing_location == False:
        resp.status_code = status.HTTP_412_PRECONDITION_FAILED
        return {"err": "Location sharing is not enabled"}

    # override previous location
    user.loc = where_the_quack

    if not dry_run:
        user.save()
    return {"msg": "Seating Section has been successfully linked to UUID"}
