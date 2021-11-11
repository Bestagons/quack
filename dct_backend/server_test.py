import server
from fastapi.testclient import TestClient

client = TestClient(server.app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the DCT Backend!"}


data = {"stations": {"Stem To Root": {"name": "Stem To Root", "menu": [{"name": "Pancakes", "station": "Stem To Root", "meal_time": "Breakfast", "calories": "100", "categories": ["carbs"]}, {"name": "Bagel", "station": "Stem To Root", "meal_time": "Breakfast", "calories": "100", "categories": ["carbs"]}], "line_speed": 0}, "Hearth and Stone": {"name": "Hearth and Stone", "menu": [{"name": "Cereal", "station": "Hearth and Stone", "meal_time": "Lunch", "calories": "102", "categories": ["vegan", "carbs"]}], "line_speed": 0}, "605 Kitchen": {"name": "605 Kitchen", "menu": [{"name": "Sandwich", "station": "605 Kitchen", "meal_time": "Lunch", "calories": "102", "categories": ["category1"]}, {"name": "Avacado Grilled Cheese", "station": "605 Kitchen", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}], "line_speed": 0}, "Spice": {"name": "Spice", "menu": [
    {"name": "Macaroni & Cheese", "station": "Spice", "meal_time": "Lunch", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "French Fries", "station": "Spice", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}], "line_speed": 0}, "Luncheonnette": {"name": "Luncheonnette", "menu": [{"name": "Pasta", "station": "Luncheonnette", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Ceasar Salad", "station": "Luncheonnette", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Veggie Fried Rice", "station": "Luncheonnette", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Portobello Mushrooms", "station": "Luncheonnette", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}], "line_speed": 0}}, "serve_times": {"Breakfast": "7am - 10am", "Lunch": "11am - 2pm", "Dinner": "2pm - 5pm"}}

def test_get_dct_data():
    response = client.get("/dct-data")
    assert response.status_code == 200
    assert response.json() == data

