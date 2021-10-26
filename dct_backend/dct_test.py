import dct

def test_dct_creation():
    DCT = dct.DCT()
    assert len(DCT.menu) == 0

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