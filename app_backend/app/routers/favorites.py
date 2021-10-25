from fastapi import APIRouter, Response, status
from pydantic import BaseModel

router = APIRouter(prefix="/favorites")


class Favorite(BaseModel):
    food_id: str
    state: int

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
async def toggle_favorite(resp: Response, favorite: Favorite):
    # check if state is valid
    if favorite.state not in [0, 1]:
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid state"}
    # check if food_id is empty
    if favorite.food_id == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Empty food_id"}

    existing_food_state = 0  # TODO: get food_id's state here
    if existing_food_state == favorite.state:
        resp.status_code = status.HTTP_412_PRECONDITION_FAILED
        return {"err": "Food ID already in that state"}

    # toggle food_id
    return {"msg": "Food ID has been successfully toggled"}