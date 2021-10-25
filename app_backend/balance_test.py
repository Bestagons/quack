from balance import BalanceTracker
import user

def show_details(BalanceTracker):  # Delete later: used for testing
    print("")
    print("Personal Details --> ")
    print("Names: ", BalanceTracker.name)
    print("Meal Swipes (remaining): ", BalanceTracker.meal_swipes)
    print("Balance (dooley): ", BalanceTracker.dooley_dollars)

def test_set_balance():
    user_info = [
        ("name1", 3000, 50),
        ("name2", 4000, 60),
        ("name3", 2000, 30)
    ]

    for user_info in user_info:
        Tester = BalanceTracker(user_info[0], user_info[1], user_info[2])
        show_details(Tester)

def test_update_balance():
    user_info = [
        ("name1", 3000, 50),
        ("name2", 4000, 60),
        ("name3", 2000, -3)
    ]

    dooley_deposit = [
        500, 60, 450
    ]

    dooley_spending = [
        3, 4000, 10
    ]

    swipe_deposit = [
        30, 25, 10
    ]


    for user_info in user_info:
        Tester = BalanceTracker(user_info[0], user_info[1], user_info[2])

        for dooleys_spent in dooley_spending:
            Tester.dooley_sub(dooleys_spent)
            show_details(Tester)

        for swipes in swipe_deposit:
            Tester.mealswipe_add(swipes)
            show_details(Tester)

        for dooleys_added in dooley_deposit:
            Tester.dooley_add(dooleys_added)
            show_details(Tester)


def main():
    test_set_balance()
    test_update_balance()
if __name__ == "__main__":
    main()




