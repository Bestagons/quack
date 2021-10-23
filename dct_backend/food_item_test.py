import food_item

def test_food_item_creation():
    test_cases = [("test_name", "station_name", "meal_time", ["category1", "category2"])]

    for test_case in test_cases:
        item = food_item.FoodItem(test_case[0], test_case[1], test_case[2], test_case[3])
        assert item.name == test_case[0]
        assert item.station == test_case[1]
        assert item.meal_time == test_case[2]
        assert item.categories == test_case[3]

