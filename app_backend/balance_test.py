from balance import BalanceTracker


def test_set_balance():
    test_cases = [
        ("name1", 3000, 50),
        ("name2", 4000.90, 60),
        ("name3", 200.00, 30)
    ]

    for user_info in test_cases:
        Tester = BalanceTracker(user_info[0], user_info[1], user_info[2])
        assert Tester.name  == user_info[0]
        assert Tester.dooley_dollars == user_info[1]
        assert Tester.meal_swipes == user_info [2]

def test_update_balance():
    test_cases = [
        ("name1", 3000, 50),
        ("name2", 4000, 60),
        ("name3", 2000, -3)
    ]

    dooley_deposit = [ # test deposit
        500, 60, 450
    ]

    dooley_spending = [
        3, 13.99, 2.50, 5.55, 300.25, 74.39, 4000, 1.99 #test spending
    ]

    swipe_deposit = [ # test deposit
        30, 25, 10
    ]
    # -------- test 1: dooley spending --------
    for test_case in test_cases:
        Tester = BalanceTracker(test_case[0], test_case[1], test_case[2])
        dooley_dollars_current = test_case[1]

        for dooleys_spent in dooley_spending:
            Tester.dooley_sub(dooleys_spent)
            if( abs(dooleys_spent) <= Tester.dooley_dollars):
                assert Tester.dooley_dollars == (dooley_dollars_current - abs(dooleys_spent))
                assert Tester.name == test_case[0]
                assert Tester.meal_swipes == test_case[2]
            elif (abs(dooleys_spent) >Tester.dooley_dollars):
                assert Tester.dooley_dollars == 0
                assert Tester.name == test_case[0]
                assert Tester.meal_swipes == test_case[2]

            dooley_dollars_current = dooley_dollars_current - dooleys_spent # updating

        # -------- test 2: swipe deposit --------
    for test_case in test_cases:
        Tester = BalanceTracker(test_case[0], test_case[1], test_case[2])
        meal_swipe_current = test_case[2]

        for swipes in swipe_deposit:
            Tester.mealswipe_add(swipes)
            assert Tester.meal_swipes == meal_swipe_current + abs(swipes)
            assert Tester.name == test_case[0]
            assert Tester.dooley_dollars == test_case[1]
            meal_swipe_current = meal_swipe_current+swipes

        # -------- test 3: dooley deposit --------
    for test_case in test_cases:
        Tester = BalanceTracker(test_case[0], test_case[1], test_case[2])
        dooley_dollars_current = test_case[1]

        for dooleys_added in dooley_deposit:
            Tester.dooley_add(dooleys_added)
            assert Tester.dooley_dollars == dooley_dollars_current + abs(dooleys_added)
            assert Tester.name == test_case[0]
            assert Tester.meal_swipes == test_case[2]
            dooley_dollars_current = dooley_dollars_current + dooleys_added
