import requests
from bs4 import BeautifulSoup
import dct

# DCT import
DCT = dct.DCT()

# setup BeautifulSoup with URL
req = requests.get("https://emoryatlanta.cafebonappetit.com/cafe/dobbs-common-table/")
soup = BeautifulSoup(req.content, "html.parser")

# Title of webpage
title = soup.title
# print(title.prettify()) #prettify() can be a useful beautifulsoup method
title = title.get_text()

def scrapeFood(mealtime, mealname, station_soup):
    # finish up from 'for each station'
    stationName = station_soup.find('h3', attrs = {'class':'site-panel__daypart-station-title'}).get_text()
    # food frames
    foodFrames_soup = station_soup.findAll('div', attrs = {'class':'site-panel__daypart-item site-panel__daypart-item--has-well-being'})
    foodFrames_soup.extend(station_soup.findAll('div', attrs = {'class':'site-panel__daypart-item'}))
    for item_soup in foodFrames_soup:
        # # scraping
        foodname = item_soup.find('button', attrs = {'class':'h4 site-panel__daypart-item-title'}).get_text().strip()
        foodcats = item_soup.find('span', attrs = {'class':'site-panel__daypart-item-cor-icons'})
        if foodcats:
            foodcats = item_soup.find('span', attrs = {'class':'site-panel__daypart-item-cor-icons'}).findAll('img')
        foodcal = item_soup.find('div', attrs = {'class':'site-panel__daypart-item-calories'}).get_text().replace('cal.','').strip()
        if foodcal:
            foodcal = int(item_soup.find('div', attrs = {'class':'site-panel__daypart-item-calories'}).get_text().replace('cal.','').strip())
        else:
            foodcal = -1
        # # printing
        # print('foodname: ' + str(foodname))
        # if foodcats:
        #     for foodcat in foodcats:
        #             print(foodcat)
        # else:
        #     foodcats = []
        # print(' foodcal: ' + str(foodcal))
        # print('mealname: ' + str(mealname))
        # print('    time: ' + str(mealtime))
        # print(' station: ' + str(stationName))
        # print("")

        # # saving
        DCT.save_food_item(foodname, stationName, mealtime, foodcal, foodcats)
        # TODO: save mealname?

        # return statement for logging purposes
        return "At " + str(stationName) + " from " + str(mealtime) + ", " + str(foodname) + " is served."  

def scrapeFrame():
    log = []
    frames_soup = soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart'})
    frames_soup.extend(soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart site-panel--daypart-even'}))
    for frame_soup in frames_soup:
        mealtime = frame_soup.find('div', attrs = {'class':'site-panel__daypart-time'}).get_text()
        mealname = frame_soup.find('h2', class_='panel__title site-panel__daypart-panel-title').get_text()
        stationFrames_soup = frame_soup.findAll('div', attrs = {'class':'station-title-inline-block'})
        for station_soup in stationFrames_soup:
            log.append(scrapeFood(mealtime, mealname, station_soup))
    return log

# MAIN
output = scrapeFrame()

# printing
print(len(output))
# print(DCT.menu)
# print('food served today:')
# for item in DCT.menu:
#     print(item.name)
# print('Stations:')
# print(DCT.stations)

# Test single scrape
# scrapeFood('testTime', 'testName', soup)

# Test DCT
# print(DCT.save_food_item('oreos', 'CRC','12:00am', 1000, ['vegan']))
# print(DCT.menu)
# for item in DCT.menu:
#     print(item.name)
# print('Stations:')
# print(DCT.stations)

#----------------- Useful first scrapes ---------------------------

# Scrape Mealtime Names from Frames
# mealmenu = soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart'})
# mealmenu.extend(soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart site-panel--daypart-even'}))
# # for row in mealmenu:
# #     print(row.find('h2', class_='panel__title site-panel__daypart-panel-title').get_text())
# # print('Number of meals today = ' + str(len(mealmenu)))

# # Scrape Meal Times
# mealtime = soup.findAll('div', attrs = {'class':'site-panel__daypart-time'})
# # for row in mealtime:
# #     print(row.get_text())

# # Scrape Food Items
# fooditem = soup.findAll('button', attrs = {'class':'h4 site-panel__daypart-item-title'})
# # for row in fooditem:
# #     print(row.get_text().strip())

# # Scrape Meal Station Names
# mealstation = soup.findAll('h3', attrs = {'class':'site-panel__daypart-station-title'})
# mealstations = []
# for row in mealstation:
#     if row.get_text() not in mealstations:
#         mealstations.append(row.get_text())
# print(mealstations)
