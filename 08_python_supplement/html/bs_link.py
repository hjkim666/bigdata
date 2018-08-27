# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup 
html = """
<html><body>
  <ul>
    <li><a href="http://www.google.com">google</a></li>
    <li><a href="http://www.facebook.com">facebook</a></li>
  </ul>
</body></html>
"""
# HTML 분석
soup = BeautifulSoup(html, 'html.parser')
# find_all() 메서드로 추출
links = soup.find_all("a")
# 링크 목록 출력
for a in links:
    href = a.attrs['href']
    text = a.string
    print(text, ">", href)
    
    