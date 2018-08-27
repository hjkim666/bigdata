import urllib.request
# 데이터 읽어 들이기
url = "http://api.aoikujira.com/ip/ini"

res = urllib.request.urlopen(url)
data = res.read()
# 바이너리를 문자열로 변환
text = data.decode("utf-8")
print(text)

