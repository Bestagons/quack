from fastapi import FastAPI
from dct import DCT
import json

app = FastAPI()

@app.get("/")
async def root():
    return {"msg": "This is the DCT Backend!"}

"""
get_dct_data implements the /dct-data route
stations: dict 
    The dictionary of station objects that contains the name, menu, and line speed of the station
meal_times: dict
    The dictionary of meal periods and the times associated with it (Ex: {'Breakfast': '7:30am - 10:00am'})
"""
@app.get("/dct-data")
async def get_dct_data(stations: dict, meal_times: dict):
    station_info = json.dumps(stations, default=lambda o: o.__dict__, 
            sort_keys=True, indent=4)
    meal_times = json.dumps(meal_times, default=lambda o: o.__dict__, 
            sort_keys=True, indent=4)
    return {
        "stations" : station_info,
        "meal_times": meal_times}