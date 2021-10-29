from food_item import FoodItem
from station import Station

def test_station_creation():
    test_cases = [
        "station_name0",
        "station_name1",
        "station_name2",
        "station_name3"]

    for test_case in test_cases:
        station = Station(test_case)

        assert station.name == test_case[0]
        assert station.menu == [] 
        assert station.line_speed == 0

def test_add_foot_item():
    test_station = Station("station_name")
    test_cases = [
            FoodItem("test_name", "station_name", "meal_time", 100, ["category1", "category5"]),
            FoodItem("test_name2", "station_name2", "meal_time2", 200, ["category2", "category6"]),
            FoodItem("test_name3", "station_name3", "meal_time3", 300, ["category3", "category7"]),
            FoodItem("test_name4", "station_name4", "meal_time4", 400, ["category4", "category8"])]

    for test_case in test_cases:
        test_station.add_food_item(test_case)
        assert test_case in test_station.menu

    assert test_station.menu == test_cases

def test_update_line_speed():
    test_speed = 10.0
    test_station = Station("station_name")
    test_station.update_line_speed(test_speed)
    assert test_station.line_speed == test_speed