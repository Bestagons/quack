from save_seating import SaveSeating


def show_details(SaveSeated):  # Delete later: used for testing
    print("")
    print("Details --> ")
    print("section: ", SaveSeated.section)
    print("color: ", SaveSeated.color)

def test_set_seat():
    section = []
    for num in range(11): # testing 0 - 10
        section.append(num)

    for sections in section:
        Tester = SaveSeating()
        Tester.section_info(sections)
        show_details(Tester)

def main():
    test_set_seat()
if __name__ == "__main__":
    main()






