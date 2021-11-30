import server
from fastapi.testclient import TestClient

def test_root():
    with TestClient(server.app) as client:
        response = client.get("/")
        assert response.status_code == 200
        assert response.json() == {"msg": "This is the DCT Backend!"}


data = {"current_serve_time": "Dinner", "stations": {"Stem To Root": {"name": "Stem To Root", "menu": [{"name": "Pancakes", "station": "Stem To Root", "meal_time": "Breakfast", "calories": "100", }, {"name": "Wings", "station": "Stem To Root", "meal_time": "Lunch", "calories": "102"}, {"name": "Macaroni & Cheese", "station": "Stem To Root", "meal_time": "Dinner", "calories": "102"}, {"name": "Pasta", "station": "Stem To Root", "meal_time": "Breakfast", "calories": "100"}], "line_speed": 0}, "605 Kitchen": {"name": "605 Kitchen", "menu": [{"name": "Bagel", "station": "605 Kitchen", "meal_time": "Lunch", "calories": "100"}, {"name": "Grilled Chicken", "station": "605 Kitchen", "meal_time": "Dinner", "calories": "102"}, {"name": "Veggie Fried Rice", "station": "605 Kitchen", "meal_time": "Breakfast", "calories": "100"}, {"name": "French Fries", "station": "605 Kitchen", "meal_time": "Lunch", "calories": "100"}], "line_speed": 0}, "Spice": {"name": "Spice", "menu": [{"name": "Cereal", "station": "Spice", "meal_time": "Dinner", "calories": "102"}, {"name": "Beyond Beef Burger", "station": "Spice", "meal_time": "Breakfast", "calories": "100"}, {"name": "Avacado Grilled Cheese", "station": "Spice", "meal_time": "Lunch", "calories": "100"}, {"name": "Ceasar Salad", "station": "Spice", "meal_time": "Dinner", "calories": "102"}], "line_speed": 0}, "Luncheonnette": {"name": "Luncheonnette", "menu": [{"name": "Sandwhich", "station": "Luncheonnette", "meal_time": "Breakfast", "calories": "102"}, {"name": "Portobello Mushrooms", "station": "Luncheonnette", "meal_time": "Lunch", "calories": "102"}, {"name": "Mediterranean Pita", "station": "Luncheonnette", "meal_time": "Dinner", "calories": "100"}], "line_speed": 0}}, "serve_times": {"Breakfast": "7am - 10am", "Lunch": "11am - 2pm", "Dinner": "2pm - 5pm"}}


def test_get_dct_data():
    with TestClient(server.app) as client:
        response = client.get("/dct-data")
        assert response.status_code == 200
        assert response.json() == data

