import requests
from bs4 import BeautifulSoup
import dct
from datetime import datetime
import pytz

def createSoup(url):
    # setup BeautifulSoup with URL
    req = requests.get(url)
    soup = BeautifulSoup(req.content, "html.parser")
    return soup

def scrapeFrame(soup):
    log = []
    serve_times = []
    frames_soup = soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart'})
    frames_soup.extend(soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart site-panel--daypart-even'}))
    current_meal_time = ""
    for frame_soup in frames_soup:
        mealtime = frame_soup.find('h2', attrs = {'class':'panel__title site-panel__daypart-panel-title'}).get_text()
        mh = frame_soup.find('div', attrs = {'class': 'site-panel__daypart-time'}).get_text()
        serve_times.append((mealtime, mh))
        meal_hour = [t.strip() for t in mh.split("-")]
        tz = pytz.timezone('EST')
        current_time = datetime.now(tz)
        start_time = tz.localize(datetime.strptime(meal_hour[0], "%I:%M %p"))
        end_time = tz.localize(datetime.strptime(meal_hour[1], "%I:%M %p"))
        if start_time.time() <= current_time.time() and current_time.time() <= end_time.time():
            current_meal_time = mealtime

        mealname = frame_soup.find('h2', class_='panel__title site-panel__daypart-panel-title').get_text()

        stationFrames_soup = frame_soup.findAll('div', attrs = {'class':'station-title-inline-block'})

        for station_soup in stationFrames_soup:
            log.extend(scrapeFood(mealtime, mealname, station_soup))
    return current_meal_time, serve_times, log

def scrapeFood(mealtime, mealname, station_soup):
    # finish up from 'for each station'
    stationName = station_soup.find('h3', attrs = {'class':'site-panel__daypart-station-title'}).get_text()
    # food frames
    foodFrames_soup = station_soup.findAll('div', attrs = {'class':'site-panel__daypart-item site-panel__daypart-item--has-well-being'})
    foodFrames_soup.extend(station_soup.findAll('div', attrs = {'class':'site-panel__daypart-item'}))
    items = []
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

        items.append((foodname, stationName, mealtime, foodcal, foodcats))
    return items
