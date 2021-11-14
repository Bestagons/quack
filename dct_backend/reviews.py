from fastapi import FastAPI, Response, status
from dotenv import load_dotenv
import os
from database import Database

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()
food_db = db.client["food"]
review_collection = food_db["reviews"]
app = FastAPI()
resp = Response

class Reviews():
    @app.post("/reviews/", status_code=status.HTTP_201_CREATED)
    async def save_review_in_db(review_rating: dict):
        if review_collection.count_documents({"username": review_rating['username']}, limit = 1) > 0: # each user can add one review per food item
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User has already made a review."}
        review_collection.insert_one(review_rating)
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully created."}
    
    @app.post("/reviews/", status_code=status.HTTP_201_CREATED)
    async def edit_review_in_db(review_rating: dict):
        if review_collection.count_documents({"username": review_rating['username']}, limit = 1) == 0: # review does not exist
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User's review does not exist"}
        
        review_collection.delete_one({"username": review_rating['username'] }) # delete
        review_collection.insert_one(review_rating) # replacement
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully edited."}

    @app.get("/reviews/")
    async def get_review_in_db(review_rating: dict):
        

