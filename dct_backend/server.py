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
async def get_dct_data(stations: dict, meal_periods: list, meal_times: list):
    station_info = json.dumps(stations, default=lambda o: o.__dict__, 
            sort_keys=True, indent=4)
    # TODO: implement helper method for meal times
    meal_periods = None
    meal_times = None
    return {
        "stations" : station_info,
        "meal_periods": meal_periods,
        "meal_times": meal_times}