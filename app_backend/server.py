from fastapi import FastAPI
from pymongo import MongoClient

app = FastAPI()

class Datbase():
    def __init__(self, username: str, password: str):

@app.get("/")
async def root():
    return {"message": "This is the App Backend!"}
