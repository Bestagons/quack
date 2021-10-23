import dct

def test_dct_creation():
    DCT = dct.DCT()
    assert len(DCT.menu) == 0

def test_save_food_item():
    DCT = dct.DCT()
    test_cases = [("test_name", "station_name", "meal_time", ["category1", "category2"])]
    total_items = 0
    for test_case in test_cases:
        assert DCT.save_food_item(test_case[0], test_case[1], test_case[2], test_case[3])
        total_items += 1
        assert total_items == len(DCT.menu)
