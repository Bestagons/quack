from balance import BalanceTracker
from user import User

class BalanceTest():
    def __init__(self, dooley_balance: float, swipe_balance: int, dooley_deposit: float, dooley_spent: float,
                 meal_swipes_deposit: int, test: bool):
        self.dooley_balance = dooley_balance
        self.swipe_balance = swipe_balance
        self.dooley_deposit = dooley_deposit
        self.dooley_spent = dooley_spent
        self.meal_swipes_deposit = meal_swipes_deposit
        self.test = test  # true or false

def test_set_balance():
    test_cases = [
        ("name1", 3000, 50),
        ("name2", 4000.90, 60),
        ("name3", 200.00, 30)
    ]

    for user_info in test_cases:
        tester = BalanceTracker(user_info[0], user_info[1], user_info[2])
        assert tester.name  == user_info[0]
        assert tester.dooley_dollars == user_info[1]
        assert tester.meal_swipes == user_info [2]

def test_update_balance():

    #D balance 0, S balance 1, D deposit 2, D spent 3, S deposit 4, Test result 5

    # -------- test 1: dooley spending --------
    test_cases_dooley_spending = [ # Only check Dooley spending cases
        (1000, 100, None, 20, None, True), # spending 20, balance 1000
        (100, 100, None, 200, None, False), # spending 200, balance 100 FAIL
        (1000, 100, None, 200, None, True), # spending 200 balance 1000
        (1000, 100, None, -20, None, False), # spending -20 balance 1000 FAIL
        (1000, 100, None, 0, None, False), # spending 0 balance 1000 FAIL
    ]

    for test_case in test_cases_dooley_spending:
        tester = BalanceTest(test_case[0],test_case[1], test_case[2], test_case[3],test_case[4], test_case[5])
        tester2 = BalanceTracker("name", test_case[0], test_case[1])
        test_check = tester2.dooley_sub(test_case[3])
        assert tester.test == test_check

    # -------- test 2: swipe deposit --------
    test_cases_swipe_deposit = [ # Only check swipe deposit cases
        (1000, 100, None, None, 20, True), # deposit 20 swipes
        (100, 100, None, None, -20, False), # deposit -20  Fail
        (1000, 100, None, None, 1, True), # deposit 1 swipe
        (1000, 100, None, None, 0, False), # deposit 0 swipes FAIL
        (1000, 100, None, None, -1, False), # deposit -1 swipes FAIL
    ]

    for test_case in test_cases_swipe_deposit:
        tester = BalanceTest(test_case[0],test_case[1], test_case[2], test_case[3],test_case[4], test_case[5])
        tester2 = BalanceTracker("name", test_case[0], test_case[1])
        test_check = tester2.mealswipe_add(test_case[4])
        assert tester.test == test_check

    # -------- test 3: dooley deposit --------
    test_cases_swipe_deposit = [ # Only check dooley deposit cases
        (1000, 100, 20, None, None, True), # deposit 20
        (100, 100, -20, None, None, False), # deposit -20  Fail
        (1000, 100, 1, None, None, True), # deposit 1
        (1000, 100, 0, None, None, False), # deposit 0 FAIL
        (1000, 100, -1, None, None, False), # deposit -1  FAIL
    ]

    for test_case in test_cases_swipe_deposit:
        tester = BalanceTest(test_case[0],test_case[1], test_case[2], test_case[3],test_case[4], test_case[5])
        tester2 = BalanceTracker("name", test_case[0], test_case[1])
        test_check = tester2.dooley_add(test_case[2])
        assert tester.test == test_check
