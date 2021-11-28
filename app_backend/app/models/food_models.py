from pydantic import BaseModel

class FavoriteFood(BaseModel):
    food_name: str
    state: bool
