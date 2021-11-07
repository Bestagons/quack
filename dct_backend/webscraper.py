import requests
from bs4 import BeautifulSoup


req = requests.get("https://emoryatlanta.cafebonappetit.com/cafe/dobbs-common-table/")

soup = BeautifulSoup(req.content, "html.parser")

res = soup.title
print(res.prettify()) # print(res.get_text())

# Scrape Mealtime Names
mealmenu = soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart'})
mealmenu.extend(soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart site-panel--daypart-even'}))
for row in mealmenu:
    print(row.find('h2', class_='panel__title site-panel__daypart-panel-title').get_text())
print('Number of meals today = ' + str(len(mealmenu)))

# Scrape Meal Times
mealtime = soup.findAll('div', attrs = {'class':'site-panel__daypart-time'})
for row in mealtime:
    print(row.get_text())

# Scrape Food Items
fooditem = soup.findAll('button', attrs = {'class':'h4 site-panel__daypart-item-title'})
for row in fooditem:
    print(row.get_text().strip())

# Scrape Meal Station Names
mealstation = soup.findAll('h3', attrs = {'class':'site-panel__daypart-station-title'})
mealstations = []
for row in mealstation:
    if row.get_text() not in mealstations:
        mealstations.append(row.get_text())
print(mealstations)

# Scrape Calories next
