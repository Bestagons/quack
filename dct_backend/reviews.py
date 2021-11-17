from fastapi import FastAPI, Response, status
from dotenv import load_dotenv
import os
from database import Database
import server
from fastapi.testclient import TestClient

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()

food_db = db.client["food"] # from food collection
review_collection = food_db["reviews"] # review --> sub collection
app = FastAPI()
resp = Response

class Reviews():
    @app.post("/reviews", status_code=status.HTTP_201_CREATED)
    async def save_review_in_db(review_rating: dict):
        """
            if a user has already reviewed an item retun err
            else insert a review
        """
        if review_collection.count_documents({"username": review_rating['username'],"foodID": review_rating['foodID']}, limit = 1) > 0: 
            # ^^each user can add one review per food item
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User has already made a review. Try editing existing review"}

        review_collection.insert_one(review_rating)
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully created."}
        
    
    @app.post("/reviews", status_code=status.HTTP_201_CREATED)
    async def edit_review_in_db(review_rating: dict):
        """
            if review does not exit return an error
            else delete old review and insert new review
        """

        if review_collection.count_documents({"username": review_rating['username']}, limit = 1) == 0: # review does not exist
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User's review does not exist"}
        
        await review_collection.delete_one({"username": review_rating['username']}) # delete
        review_collection.insert_one(review_rating) # replacement
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully edited."}

    @app.get("/reviews")
    async def get_reviews( review_rating: dict):
        """
            returns all reviews for food item that matches 'foodID'
        """
        return review_collection.find_one({"foodID": review_rating['foodID']})
       