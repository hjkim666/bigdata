# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup 
html = """
<html><body>
  <h1 id="title">파이썬스크래핑테스트?</h1>
  <p id="body">Beautifulsoup을 이용하기</p>
  <p>특정 부분 추출하기 </p>
</body></html>
"""
# HTML 분석
soup = BeautifulSoup(html, 'html.parser')
# find() 메서드로 원하는 부분 추출
title = soup.find(id="title")
body  = soup.find(id="body")
# 텍스트 부분 출력
print("#title=" + title.string)
print("#body="  + body.string)

      