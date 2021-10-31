from sections import Sections

"""
Section: The seating section (numbered from 1 to 9)
Color: The respective color associated with each seating section

"""

class SaveSeating():

    def __init__(self):
        self.section = None
        self.color = None

    def set_section_info(self, section:int) -> bool:
        """

        This function updates the object with the section number and respective color

        section: The seating section number (based off of @BrendaCano 's Map)
        return: Void (None)

        """
        if 0 < section <= 9:
            self.section = section
            self.color = Sections.section_dict.get(self.section)
            return True
        else:
            return False



