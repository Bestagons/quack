import server
from fastapi.testclient import TestClient

client = TestClient(server.app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"msg": "This is the DCT Backend!"}


data = {"stations": {"Stem To Root": {"name": "Stem To Root", "menu": [{"name": "Pancakes", "station": "Stem To Root", "meal_time": "Breakfast", "calories": "100", "categories": ["carbs"]}, {"name": "Wings", "station": "Stem To Root", "meal_time": "Lunch", "calories": "102", "categories": ["category1"]}, {"name": "Macaroni & Cheese", "station": "Stem To Root", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Pasta", "station": "Stem To Root", "meal_time": "Breakfast", "calories": "100", "categories": ["carbs"]}], "line_speed": 0}, "605 Kitchen": {"name": "605 Kitchen", "menu": [{"name": "Bagel", "station": "605 Kitchen", "meal_time": "Lunch", "calories": "100", "categories": ["carbs"]}, {"name": "Grilled Chicken", "station": "605 Kitchen", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Veggie Fried Rice", "station": "605 Kitchen", "meal_time": "Breakfast", "calories": "100", "categories": ["carbs"]}, {"name": "French Fries", "station": "605 Kitchen", "meal_time": "Lunch", "calories": "100", "categories": [
    "carbs"]}], "line_speed": 0}, "Spice": {"name": "Spice", "menu": [{"name": "Cereal", "station": "Spice", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Beyond Beef Burger", "station": "Spice", "meal_time": "Breakfast", "calories": "100", "categories": ["carbs"]}, {"name": "Avacado Grilled Cheese", "station": "Spice", "meal_time": "Lunch", "calories": "100", "categories": ["carbs"]}, {"name": "Ceasar Salad", "station": "Spice", "meal_time": "Dinner", "calories": "102", "categories": ["vegan", "carbs"]}], "line_speed": 0}, "Luncheonnette": {"name": "Luncheonnette", "menu": [{"name": "Sandwhich", "station": "Luncheonnette", "meal_time": "Breakfast", "calories": "102", "categories": ["category1"]}, {"name": "Portobello Mushrooms", "station": "Luncheonnette", "meal_time": "Lunch", "calories": "102", "categories": ["vegan", "carbs"]}, {"name": "Mediterranean Pita", "station": "Luncheonnette", "meal_time": "Dinner", "calories": "100", "categories": ["carbs"]}], "line_speed": 0}}, "serve_times": {"Breakfast": "7am - 10am", "Lunch": "11am - 2pm", "Dinner": "2pm - 5pm"}}


def test_get_dct_data():
    response = client.get("/dct-data")
    assert response.status_code == 200
    assert response.json() == data

