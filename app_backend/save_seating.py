from sections import Sections

"""
Section: The seating section (numbered from 1 to 9)
Color: The respective color associated with each seating section

"""

class SaveSeating(Sections):

    def __init__(self):
        super().__init__()
        self.section = None
        self.color = None

    def section_info(self, section:int) -> None:
        """

        This function updates the object with the section number and respective color

        section: The seating section number (based off of Brenda's Map)
        return: Void (None)

        """
        if 0 < section <= 9:
            self.section = section
            self.color = Sections.section_dict.get(self.section)
        return None



