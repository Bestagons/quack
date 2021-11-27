from sections import Sections

from fastapi import APIRouter, Response, status
from dotenv import load_dotenv
import os
from database import Database
from pydantic import BaseModel
import server

load_dotenv()
db = Database(os.getenv('DB_USERNAME'), os.getenv('DB_PASSWORD'))
db.connect()


router = APIRouter(prefix="/seating")
resp = Response



class SaveSeating(BaseModel):
    """
        section: The seating section (numbered from 1 to 9)

        color: The respective color associated with each seating section

    """
    section: int
    color: str


@router.post("/dct-seating-section", status_code=status.HTTP_201_CREATED)
async def set_section_info(resp: Response, seating_info: SaveSeating, dry_run) -> bool:
    """

    This function updates the object with the section number and respective color

    section: The seating section number (based off of @BrendaCano 's Map)
    return: True or False (error handling)

    """
    if dry_run:
        if 0 < seating_info.section <= 9:

            return True
        else:
            return False


    if (not dry_run):
        if seating_info.section == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No seating section number specified"}
        if seating_info.color == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No seating section color specified"}






