from fastapi import APIRouter, Response, status
from dotenv import load_dotenv
import os
from database import Database
from pydantic import BaseModel


load_dotenv()
db = Database(os.getenv('DB_USERNAME'), os.getenv('DB_PASSWORD'))
db.connect()

food_db = db.client["food"] # from food collection
review_collection = food_db["reviews"] # review --> sub collection
router = APIRouter(prefix="/reviews")

class Reviews(BaseModel):
    """
        food_name - the name or id associated with a food item

        rating - 1 to 5 stars

        review - written review

        userame - unique ID for each user of quack app
    """
    food_name: str
    rating: int
    review: str
    email: str
    dry_run: bool = False



@router.post("/review", status_code=status.HTTP_201_CREATED)
async def save_review_in_db(resp: Response, review_rating: Reviews):
    """
        if a user has already reviewed an item retun err
        else insert a review

        *only saves reviews that are not tests
    """
    if review_rating.food_name == "" or review_rating.food_name != review_rating.food_name.lower():
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Inappropriate food name"}
    if review_rating.email == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "No email specified"}

        # review_rating.food_name = review_rating.food_name.lower()  # to lowercase

    if review_collection.count_documents({"email": review_rating.email, "foodID": review_rating.food_name}, limit = 1) > 0: # each user can add one review per food item
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "User has already made a review. Try editing existing review"}

    if not review_rating.dry_run:
        review_collection.insert_one({"food_name": review_rating.food_name, "rating": review_rating.rating, "review": review_rating.review, "email": review_rating.email})
    resp.status_code = status.HTTP_201_CREATED
    return {"msg": "Review has been successfully created."}


@router.post("/edit-review", status_code=status.HTTP_201_CREATED)
async def edit_review_in_db(resp: Response, review_rating: Reviews, dry_run = False):
    """
        if review does not exit return an error
        else delete old review and insert new review

        *only edits reviews that are not tests
    """
    if(dry_run):
        if review_rating.food_name != review_rating.food_name.lower():# check if food_name is in valid format!
            return False # wrong food_name format
        else:
            return True

    if(not dry_run): # if false
        if review_rating.food_name == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "Empty foodID"}
        if review_rating.email == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No email specified"}

        review_rating.food_name = review_rating.food_name.lower() # to lowercase

        if review_collection.count_documents({"email": review_rating.username,"foodID": review_rating.food_name}, limit = 1) == 0: # review does not exist for specified food item
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User's review does not exist"}

        await review_collection.delete_one({"email": review_rating['email']}) # delete old review
        review_collection.insert_one(review_rating) # replacement
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully edited."}

@router.get("/get-reviews")
async def get_reviews(resp: Response, review_rating: Reviews):
    """
        returns all reviews for food item that matches 'foodID'
    """
    review_rating.food_name = review_rating.food_name.lower()  # to lowercase
    return review_collection.find_one({"foodID": review_rating.food_name})
