import requests
from bs4 import BeautifulSoup


req = requests.get("https://emoryatlanta.cafebonappetit.com/cafe/dobbs-common-table/")

soup = BeautifulSoup(req.content, "html.parser")

res = soup.title

mealmenu = soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart'})
mealmenu.extend(soup.findAll('section', attrs = {'class':'panel s-wrapper site-panel site-panel--daypart site-panel--daypart-even'}))

for row in mealmenu:
    print(row.find('h2', class_='panel__title site-panel__daypart-panel-title').get_text())

print(len(mealmenu))

# for row in mealmenu:
#     print(row.get_text)

# print(res.get_text())