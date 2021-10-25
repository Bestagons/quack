import food_station

def test_food_station():
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

    for test_case in test_cases:
        station = food_station.FoodStation(test_case)

        assert station.name == test_case   
                       