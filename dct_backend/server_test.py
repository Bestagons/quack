import server
from fastapi.testclient import TestClient

client = TestClient(server.app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"quack": "Hello World!"}

