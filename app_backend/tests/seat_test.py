from ..save_seating import SaveSeating
from ..sections import Sections

def test_set_seat():
    section = []

    for num in range(11): # testing 0 - 10
        section.append(num)

    for sections in section:
        tester = SaveSeating()
        test_success =  tester.set_section_info(sections)
        if (0 <= sections <= 9): # Success Cases (0 is none)
            assert tester.color == Sections.color_dict.get(tester.section)
            assert tester.section == sections
            assert test_success == True # true on success
        else: # Failure Cases
            assert tester.color == None
            assert tester.section == None
            assert test_success == False # False on Failure







