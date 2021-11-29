from fastapi import APIRouter, Response, status, Depends, Security
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from ..models.user_models import AddFriend
from ..auth_bearer import JWTBearer
from ..auth_handler import decodeJWT
from database import db
import json
from bson import json_util


print("Starting server...")

router = APIRouter(prefix="/friends")
security = JWTBearer() 

"""
    add_friend implements the /new-friend route

    resp: Response
        The response to send back to the user which contains the status code and body

    uuid: str
        The UUID of the user who is adding the new friend

    fuuid: str
        The UUID of the friend to be added

    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@router.post("/new-friend", status_code=status.HTTP_201_CREATED)
async def add_friend(resp: Response, friend: AddFriend):
    # TODO: Verify email/user exists
    if friend.friend_email == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid Friend UUID"}

    # check if the uuid does not already contain fuuid
    uuid_friends = ["test.friend@emory.edu"]  # TODO: get uuid's friends here
    if friend.friend_email in uuid_friends:
        resp.status_code = status.HTTP_412_PRECONDITION_FAILED
        return {"err" : "FUUID already linked to UUID"}

    # add fuuid
    uuid_friends.append(friend.friend_email)
    return {"msg" : "FUUID has been successfully linked to UUID"}

@router.post("/get-friends", status_code=status.HTTP_200_OK, dependencies=[Depends(security)])
async def get_friends(resp: Response, token: HTTPAuthorizationCredentials = Security(security)):
    payload = decodeJWT(token)
    if payload is not None:
        uuid = payload["user_id"]
        user = db.get_user_by_uuid(uuid)
        friends = []
        for friend_email in user["friends"]:
            fu = db.get_user_by_email(friend_email)
            friends.append(json.loads(json_util.dumps(fu)))
        return friends
    else:
        resp.status_code = status.HTTP_401_UNAUTHORIZED
        return {"err": "Unauthorized - Could not verify user"}
