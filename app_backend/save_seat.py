from sections import Sections

from fastapi import APIRouter, Response, status
from dotenv import load_dotenv
import os
from database import Database
from pydantic import BaseModel
from sections import Sections
#import server

load_dotenv()
db = Database(os.getenv('DB_USERNAME'), os.getenv('DB_PASSWORD'))
db.connect()


router = APIRouter(prefix="/seating")
resp = Response

seating_db = db.client["user"] # from user collection
seating_collection = seating_db["seating"] # review --> sub collection



class SaveSeating(BaseModel):
    """
        section: The seating section (numbered from 1 to 9)

        color: The respective color associated with each seating section

    """
    section: int # required
    username: str # required
    color: str # not required


@router.post("/dct-seating-section", status_code=status.HTTP_201_CREATED)
async def set_section_info(resp: Response, seating_info: SaveSeating, dry_run) -> bool:
    """

    This function updates the object with the section number and respective color

    section: The seating section number (based off of @BrendaCano 's Map)
    return: True or False (error handling)

    """

    if dry_run: # for testing purposes
        if 0 < seating_info.section <= 9: # valid
            return True
        else: # invalid
            return False

    if (not dry_run):
    # ==== Error Handling: ====
        if seating_info.section == "" :
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No seating section number specified"}
        if seating_info.color == "":
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "No seating section color specified"}
        if 0 >= seating_info.section or seating_info.section > 9:
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "Invalid section number specified"}

        if ((Sections.color_dict.get(seating_info.section) != seating_info.color) and (seating_info.section != None)):
            resp.status_code = status.HTTP_400_BAD_REQUEST
            return {"err": "Invalid section number specified"}
     # ==== Save Seating for user  ====    
        if seating_collection.count_documents({"username": seating_info.username}, limit = 1 )== 0: # save seated
            seating_collection.insert_one(seating_info)
            resp.status_code = status.HTTP_201_CREATED
            return {"msg": "Seating Section has been successfully saved."}

        if seating_collection.count_documents({"username": seating_info.username}, limit =1 ) > 0: #update seated
            await seating_collection.delete_one({"username": seating_info['username']}) # delete old saved section
            seating_collection.insert_one(seating_info) # save new seated section
            resp.status_code = status.HTTP_201_CREATED
            return {"msg": "Seating Section has been successfully saved."}












