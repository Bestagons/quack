from save_seating import SaveSeating
from sections import Sections

def test_set_seat():
    section = []

    for num in range(11): # testing 0 - 10
        section.append(num)

    for sections in section:
        Tester = SaveSeating()
        Test_success =  Tester.set_section_info(sections)
        if (0< sections <=9): # Success Cases
            assert Tester.color == Sections.section_dict.get(Tester.section)
            assert Tester.section == sections
            assert Test_success == True # true on success
        else: # Failure Cases
            assert Tester.color == None
            assert Tester.section == None
            assert Test_success == False # False on Failure







