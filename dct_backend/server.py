from fastapi import FastAPI
from dct import DCT
from webscraper import scrapeFrame, createSoup
import sys

def scrape_data(dct: DCT):
    soup = createSoup("https://emoryatlanta.cafebonappetit.com/cafe/dobbs-common-table/")
    output = scrapeFrame(soup)
    dct.clear_data()

    if "pytest" in sys.modules:
        print("Using mocked data..")
        dct.save_food_item('Pancakes','Stem To Root','Breakfast','100',['carbs'])
        dct.save_food_item('Bagel', '605 Kitchen', 'Lunch', '100', ['carbs'])
        dct.save_food_item('Cereal', 'Spice', 'Dinner', '102', ['vegan', 'carbs'])
        dct.save_food_item('Sandwhich', 'Luncheonnette','Breakfast','102',['category1'])
        dct.save_food_item('Wings', 'Stem To Root','Lunch','102',['category1'])
        dct.save_food_item('Grilled Chicken', '605 Kitchen','Dinner','102',['vegan', 'carbs'])
        dct.save_food_item('Beyond Beef Burger', 'Spice', 'Breakfast', '100',['carbs'])
        dct.save_food_item('Portobello Mushrooms', 'Luncheonnette','Lunch','102',['vegan', 'carbs'])
        dct.save_food_item('Macaroni & Cheese', 'Stem To Root','Dinner','102',['vegan', 'carbs'])
        dct.save_food_item('Veggie Fried Rice', '605 Kitchen', 'Breakfast', '100',['carbs'])
        dct.save_food_item('Avacado Grilled Cheese', 'Spice', 'Lunch', '100',['carbs'])
        dct.save_food_item('Mediterranean Pita', 'Luncheonnette', 'Dinner', '100',['carbs'])
        dct.save_food_item('Pasta', 'Stem To Root', 'Breakfast','100',['carbs'])
        dct.save_food_item('French Fries', '605 Kitchen', 'Lunch', '100',['carbs'])
        dct.save_food_item('Ceasar Salad', 'Spice','Dinner','102',['vegan', 'carbs'])

        dct.save_serve_time('Breakfast', '7am - 10am')
        dct.save_serve_time('Lunch', '11am - 2pm')
        dct.save_serve_time('Dinner', '2pm - 5pm')
    else:
        for entry in output:
            dct.save_food_item(*entry)
        print("Successfully scrapped new data")

dct = DCT()
app = FastAPI()

@app.on_event("startup")
async def startup_event():
    scrape_data(dct)


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
async def get_dct_data():
    return {
        "stations" : dct.stations,
        "serve_times": dct.serve_times}

@app.get("/dct-update-data")
async def update_data():
    scrape_data(dct)
    return {"msg": "Updating data"}

