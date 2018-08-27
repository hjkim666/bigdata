# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup 
html = """
<html><body>
<div id="meigen">
  <h1>파이썬</h1>
  <ul class="items">
    <li>넘파이</li>
    <li>판다스</li>
    <li>아이파이썬</li>
  </ul>
</div>
</body></html>
"""
# HTML 분석
soup = BeautifulSoup(html, 'html.parser')
# 필요한 부분을 CSS 쿼리로 추출
# 타이틀 부분 추출하기
h1 = soup.select_one("div#meigen > h1").string
print("h1 =", h1)
# 목록 부분 추출
li_list = soup.select("div#meigen > ul.items > li")
for li in li_list:
  print("li =", li.string)
  
  