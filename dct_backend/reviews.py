from fastapi import APIRouter, Response, status
from dotenv import load_dotenv
import os
from database import Database
from pydantic import BaseModel
import server
# from fastapi.testclient import TestClient

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()

food_db = db.client["food"] # from food collection
review_collection = food_db["reviews"] # review --> sub collection
# app = FastAPI()
router = APIRouter(prefix="/reviews")
resp = Response

class Reviews(BaseModel):
    """
        foodID - the name or id associated with a food item

        rating - 1 to 5 stars

        review - written review

        userame - unique ID for each user of quack app
    """
    food_id: str
    rating: int
    review: str
    username: str
    
@router.post("/reviews", status_code=status.HTTP_201_CREATED)
async def save_review_in_db(resp: Response, review_rating: Reviews, is_test = False):
    """
        if a user has already reviewed an item retun err
        else insert a review

        *only saves reviews that are not tests
    """
    if(not is_test): # if false
        if review_rating.food_id == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "Empty foodID"}
        if review_rating.username == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No user specified"}     
        if review_collection.count_documents({"username": review_rating.username,"foodID": review_rating.food_id}, limit = 1) > 0: # each user can add one review per food item
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User has already made a review. Try editing existing review"}

        review_collection.insert_one(review_rating)
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully created."}
    

@router.post("/edit-review", status_code=status.HTTP_201_CREATED)
async def edit_review_in_db(review_rating: Reviews, is_test = False):
    """
        if review does not exit return an error
        else delete old review and insert new review

        *only edits reviews that are not tests
    """
        
    if(not is_test): # if false
        if review_rating.food_id == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "Empty foodID"}
        if review_rating.username == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No user specified"}

        if review_collection.count_documents({"username": review_rating.username,"foodID": review_rating.food_id }, limit = 1) == 0: # review does not exist for specified food item
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User's review does not exist"}
        
        await review_collection.delete_one({"username": review_rating['username']}) # delete old review
        review_collection.insert_one(review_rating) # replacement
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully edited."}

@router.get("/reviews")
async def get_reviews(review_rating: Reviews):
    """
        returns all reviews for food item that matches 'foodID'
    """
    return review_collection.find_one({"foodID": review_rating.food_id})
    