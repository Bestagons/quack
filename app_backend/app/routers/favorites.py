from fastapi import APIRouter, Response, status, Security
from ..auth_bearer import JWTBearer
from fastapi.security import HTTPAuthorizationCredentials
from database import db
from models.user import User
from app.auth_handler import decodeJWT
from ..models.food_models import FavoriteFood

router = APIRouter(prefix="/favorites")
security = JWTBearer()


"""
    toggle_favorite implements the /toggle_favorite route

    resp: Response
        The response to send back to the user which contains the status code and body

    food_id: str
        The UUID of the food to be toggled

    state: int
        The new state of the food. 0 for unfavorited, 1 for favorited.
        Repeating the same state will not change the state.

    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@router.post("/toggle-favorite/", status_code=status.HTTP_200_OK)
async def toggle_favorite(resp: Response, favorite: FavoriteFood, token: HTTPAuthorizationCredentials = Security(security)):
    payload: dict = decodeJWT(token)
    user_id = payload["user_id"]
    user: User = User().get_user_by_id(user_id)

    # check if state is valid
    if not isinstance(favorite.state, bool):
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid state"}
    # check if food_id is empty
    if favorite.food_name == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Empty food_id"}

    favorites = user.favorites
    if (favorite.food_name in favorites) == favorite.state:
        resp.status_code = status.HTTP_200_OK
        return {"msg": "No row is affected."}
    else:
        if favorite.state:
            favorites.append(favorite.food_name)

    # Save
    user.favorites = favorites
    user.save()

    return {"msg": "Food ID has been successfully toggled"}

