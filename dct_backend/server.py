from fastapi import FastAPI
from dct import DCT

app = FastAPI()
dct = DCT()

# Mock data
dct.save_food_item('Pancakes','Stem To Root','Breakfast','100',['carbs'])
dct.save_food_item('Bagel','Stem To Root','Breakfast','100',['carbs'])
dct.save_food_item('Cereal', 'Hearth and Stone','Lunch','102',['vegan', 'carbs'])
dct.save_food_item('Sandwich', '605 Kitchen','Lunch','102',['category1'])
dct.save_food_item('Macaroni & Cheese', 'Spice','Lunch','102',['vegan', 'carbs'])
dct.save_food_item('Pasta', 'Luncheonnette','Dinner','102',['vegan', 'carbs'])
dct.save_food_item('Ceasar Salad', 'Luncheonnette','Dinner','102',['vegan', 'carbs'])
dct.save_food_item('Avacado Grilled Cheese', '605 Kitchen','Dinner','102',['vegan', 'carbs'])
dct.save_food_item('French Fries', 'Spice','Dinner','102',['vegan', 'carbs'])
dct.save_food_item('Veggie Fried Rice', 'Luncheonnette','Dinner','102',['vegan', 'carbs'])
dct.save_food_item('Portobello Mushrooms', 'Luncheonnette','Dinner','102',['vegan', 'carbs'])

dct.save_serve_time('Breakfast', '7am - 10am')
dct.save_serve_time('Lunch', '11am - 2pm')
dct.save_serve_time('Dinner', '2pm - 5pm')

@app.get("/")
async def root():
    return {"msg": "This is the DCT Backend!"}

"""
get_dct_data implements the /dct-data route
stations: dict 
    The dictionary of station objects that contains the name, menu, and line speed of the station
serve_times: dict
    The dictionary of meal periods and the times associated with it (Ex: {'Breakfast': '7:30am - 10:00am'})
"""
@app.get("/dct-data")
async def get_dct_data(stations: dict = dct.stations, serve_times: dict = dct.serve_times):
    return {
        "stations" : stations,
        "serve_times": serve_times}