from app.app import app
from fastapi.testclient import TestClient
from fastapi import status

client = TestClient(app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the App Backend!"}
