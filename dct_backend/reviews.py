from fastapi import FastAPI, Response, status
from dotenv import load_dotenv
import os
from database import Database

load_dotenv()
db = Database(os.getenv("DB_USERNAME"), os.getenv("DB_PASSWORD"))
db.connect()
food_db = db.client["food"]
review_collection = food_db["reviews"]
resp = Response

class Reviews():
    def save_review_in_db(review_rating: dict):
        if review_collection.count_documents({"_id": review_rating['_id']}, limit = 1) > 0: # each user can add one review per food item
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "User has already made a review. Edit review instead."}
        review_collection.insert_one(review_rating)
        resp.status_code = status.HTTP_201_CREATED
        return {"msg": "Review has been successfully created."}

