from fastapi import FastAPI
from .routers import favorites, friends
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(favorites.router)
app.include_router(friends.router)


@app.get("/")
async def root():
    return {"msg": "This is the App Backend!"}
