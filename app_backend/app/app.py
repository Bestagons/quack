from fastapi import FastAPI
from .routers import favorites, friends, user, save_seat
from fastapi.middleware.cors import CORSMiddleware
import firebase_admin
from firebase_admin import credentials


app = FastAPI()

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(favorites.router)
app.include_router(friends.router)
app.include_router(user.router)
app.include_router(save_seat.router)


@app.get("/")
async def root():
    return {"msg": "This is the App Backend!"}
