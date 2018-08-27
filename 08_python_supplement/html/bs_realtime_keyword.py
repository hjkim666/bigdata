from bs4 import BeautifulSoup
import urllib.request as MyURL
url = 'http://www.naver.com'
response = MyURL.urlopen(url)
soup = BeautifulSoup(response, "html.parser")
ul=soup.find_all('ul',class_='ah_l')
# print(ul)
# print(ul[0].li.a.span.string)
# print(ul[0].li.a.span.find_next_sibling().string)

for x in range(len(ul)):
    print(ul[x].li.a.span.string)
    print(ul[x].li.a.span.find_next_sibling().string)

#print(ul[0].li.select(".ah_k")[0].string)
# for item in ul[0]:
#     s=item.select()
# #     for i in range(len(s)):
# #         if s[i]["class"][0] == "ah_k":
# #             print(s[i].string)
#     ul.select('.ah_r')