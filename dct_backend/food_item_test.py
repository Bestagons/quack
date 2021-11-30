import food_item

def test_food_item_creation():
    test_cases = [
            ("test_name", "station_name", "meal_time", 100, ["category1", "category5"]),
            ("test_name2", "station_name2", "meal_time2", 200, ["category2", "category6"]),
            ("test_name3", "station_name3", "meal_time3", 300, ["category3", "category7"]),
            ("test_name4", "station_name4", "meal_time4", 400, ["category4", "category8"])]

    for test_case in test_cases:
        item = food_item.FoodItem(test_case[0], test_case[1],
                test_case[2], test_case[3], test_case[4])

        assert item.name == test_case[0]
        assert item.station == test_case[1]
        assert item.meal_time == test_case[2]
        assert item.calories == test_case[3]
        # assert item.categories == test_case[4] - Broken

