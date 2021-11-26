from app.app import app
import database
from fastapi.testclient import TestClient
from fastapi import status
from dotenv import load_dotenv
import os

client = TestClient(app)
load_dotenv()

"""
    Authenticate your test by getting a fresh token
    using a test user from the database
"""
def authenticate_test() -> str:
    name = os.getenv("TEST_USER_NAME")
    email = os.getenv("TEST_USER_EMAIL")
    password = os.getenv("TEST_USER_PASSWORD")

    if name is None or email is None or password is None:
        print("[authenticate_test.py - ERROR] Test user auth is None. Check your .env files for the test user authentication.")
        return ""

    auth = {"name": name, "email": email, "password": password}
    response = client.post("user/login", json=auth)

    assert response.status_code == status.HTTP_200_OK
    _, token, _ = response.json()
    assert isinstance(token, dict)
    assert "access_token" in token.keys()
    token = token["access_token"]
    assert isinstance(token, str)
    assert token != ""
    return token

