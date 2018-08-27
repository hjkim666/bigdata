# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
# 분석하고 싶은 HTML
html = """
<html><body>
  <h1>파이썬스크래핑테스트?</h1>
  <p>Beautifulsoup을 이용하기</p>
  <p>특정 부분 추출하기 </p>
</body></html>
"""
# HTML 분석
soup = BeautifulSoup(html, 'html.parser')
# 원하는 부분 추출
h1 = soup.html.body.h1
p1 = soup.html.body.p
p2 = p1.next_sibling.next_sibling
#p2 = p1.next_sibling.next_sibling.next_sibling

# 요소의 글자 출력
print("h1 = " + h1.string)
print("p  = " + p1.string)
print("p  = " + p2.string)
#print("p  = " + p2.tag)


