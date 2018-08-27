from bs4 import BeautifulSoup 
from urllib.request import urlopen

html = urlopen('http://www.yes24.com/Mall/Main/Book/001?CategoryNumber=001')
soup = BeautifulSoup(html, 'html.parser')
b = soup.find_all(class_="rnk_name")
for x in b:
    #print(x.a.string, end='\t')
    #print(x.a['href'])
    print("책제목: {0} , 웹사이트 주소: {1}".format(x.a.string,x.a['href']))
print("book =", b)