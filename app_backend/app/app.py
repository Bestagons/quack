from fastapi import FastAPI
from .routers import favorites, friends

app = FastAPI()


app.include_router(favorites.router)
app.include_router(friends.router)


@app.get("/")
async def root():
    return {"msg": "This is the App Backend!"}
