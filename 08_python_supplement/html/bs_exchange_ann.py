# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
import urllib.request as req
# HTML 가져오기
url = "http://info.finance.naver.com/marketindex/"
res = req.urlopen(url)
# HTML 분석하기
soup = BeautifulSoup(res, "html.parser")
# 원하는 데이터 추출
# price = soup.select_one("div.head_info > span.value").string
# print("usd/krw =", price)
# 
# price = soup.select_one("div.market2 > div.data > ul.data_lst > li.on > a.head > div.head_info > span.value").string
# print("엔달러환율 =", price)

price = soup.select("div.head_info > span.value")
print(price[0].string)
print(price[4].string)

