# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup 
# BeautifulSoup로 분석하기
xml = open("getTradList.xml", "r", encoding="utf-8").read()
soup = BeautifulSoup(xml, 'html.parser')

print(soup.find_all("item"))

info = {}
for location in soup.find_all("item"):
    year = location.find('year').string
    balpayments = location.find('balpayments').string
    expcnt = location.find('expcnt').string
    expdlr = location.find('expdlr').string
   # print("year:{0}, balpayment:{1}, expcnt:{2}, expdlr:{3}".format(year, balpayments, expcnt, expdlr))
    print("연도:{0}, 무역수지:{1}, 수출건수:{2}, 수출금액:{3}".format(year, balpayments, expcnt, expdlr))

        
        