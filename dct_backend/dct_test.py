import dct

def test_dct_creation():
    DCT = dct.DCT()
    assert len(DCT.menu) == 0

def test_save_food_item():
    DCT = dct.DCT()
    test_cases = [
            ("test_name", "station_name", "meal_time", 100, ["category1", "category5"]),
            ("test_name2", "station_name2", "meal_time2", 200, ["category2", "category6"]),
            ("test_name3", "station_name3", "meal_time3", 300, ["category3", "category7"]),
            ("test_name4", "station_name4", "meal_time4", 400, ["category4", "category8"])]
    total_items = 0
    for test_case in test_cases:
        assert DCT.save_food_item(test_case[0], test_case[1],
                test_case[2], test_case[3], test_case[4])
        total_items += 1
        assert total_items == len(DCT.menu)

def test_save_food_station():
    DCT = dct.DCT()
    test_cases = [
        ("station_name1"),
        ("station_name2"),
        ("station_name3"),
        ("station_name4"),
        ("station_name5"),
        ("station_name6"),
        ("station_name7"),
        ("station_name8"),
        ("station_name9"),
    ]
    total_stations = 0
    for test_case in test_cases:
        station = DCT.save_food_station(test_case)
        total_stations += 1
        assert total_stations == len(DCT.stations) 
                