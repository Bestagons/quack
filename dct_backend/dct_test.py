import dct

def test_dct_creation():
    DCT = dct.DCT()
    assert len(DCT.menu) == 0
    assert len(DCT.stations) == 0
    assert len(DCT.serve_times) == 0

def test_save_station():
    DCT = dct.DCT()
    test_cases = ["station_name", "station_name2", "station_name3", "station_name4"]
    total_items = 0
    for test_case in test_cases:
        assert DCT.save_station(test_case)
        total_items += 1
        assert total_items == len(DCT.stations)

def test_save_serve_time():
    DCT = dct.DCT()
    test_cases = [
            ("period_name", "time_name"),
            ("period_name2", "time_name2"),
            ("period_name3", "time_name3"),
            ("period_name4", "time_name4")]
    total_items = 0
    for test_case in test_cases:
        DCT.save_serve_time(test_case[0], test_case[1])
        total_items += 1
        assert total_items == len(DCT.serve_times)

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

def test_update_line_speed():
    DCT = dct.DCT()
    test_station = "station_name"
    DCT.save_station(test_station)
    DCT.update_line_speed(test_station, 3.0)
    assert DCT.stations[test_station].line_speed == 3.0
    
def test_incoming_dct_traffic():
    DCT = dct.DCT()
    test_cases = [
        (10, 10, 20),
        (0, 10, 10),
        (10, 0, 10)
    ]
    takeout_c = 0
    dinein_c = 0
    total_c = 0
    for test_case in test_cases:
        takeout_c += test_case[0]
        dinein_c += test_case[1]
        total_c += test_case[2]
        DCT.incoming_dct_traffic(test_case[0], 
                                test_case[1])
        assert DCT.takeout_capacity == takeout_c
        assert DCT.dinein_capacity == dinein_c
        assert DCT.total_capacity == total_c

def test_outgoing_dct_traffic():
    DCT = dct.DCT()
    test_cases = [
        (10, 10, 20),
        (0, 10, 10),
        (10, 0, 10)
    ]
    takeout_c = 15
    dinein_c = 15
    total_c = 30
    DCT.takeout_capacity = 15
    DCT.dinein_capacity = 15
    DCT.total_capacity = 30
    for test_case in test_cases:
        takeout_c -= test_case[0]
        dinein_c -= test_case[1]
        total_c -= test_case[2]
        if (takeout_c < 0):
            takeout_c = 0
        if (dinein_c < 0):
            dinein_c = 0
        if (total_c < 0):
            total_c = 0
        DCT.outgoing_dct_traffic(test_case[0], 
                                test_case[1])
        assert DCT.takeout_capacity == takeout_c
        assert DCT.dinein_capacity == dinein_c
        assert DCT.total_capacity == total_c
