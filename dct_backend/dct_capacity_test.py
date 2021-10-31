import dct_capacity

def test_dct_capacity():
    test_cases = [
        (10, 10, 20),
        (0, 10, 10),
        (10, 0, 10)
    ]

    for test_case in test_cases:
        capacity = dct_capacity.Capacity(test_case[0], 
                                test_case[1], test_case[2])
        
        assert capacity.takeout == test_case[0]
        assert capacity.dinein == test_case[1]
        assert capacity.totalcapacity == test_case[2]