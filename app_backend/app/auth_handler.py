import time
from typing import Dict
from dotenv import load_dotenv
import os
import jwt
from bson.objectid import ObjectId

load_dotenv()

JWT_SECRET = os.getenv("SECRET")
JWT_ALGORITHM = os.getenv("ALGORITHM")


def token_response(token: str):
    return {
        "access_token": token
    }


def signJWT(user_id: ObjectId) -> Dict[str, str]:
    if isinstance(user_id, ObjectId):
        user_id = str(user_id)
    payload = {
        "user_id": user_id,
        "expires": time.time() + 600  # 10 minutes
    }
    token = jwt.encode(payload, JWT_SECRET, algorithm=JWT_ALGORITHM)
    return token_response(token)

def decodeJWT(token: str) -> dict:
    try:
        decoded_token = jwt.decode(token, JWT_SECRET, algorithms=[JWT_ALGORITHM])
        return decoded_token if decoded_token["expires"] >= time.time() else None
    except Exception as e:
        print("Got error trying to decode JWT: " + str(e))
        return {}

