import codecs
filename = "top_city.csv"
csv = codecs.open(filename, "r", "utf-8").read()

data = []
rows = csv.split("\r\n")
for row in rows:
    if row == "": continue
    cells = row.split(",")
    data.append(cells)
    
# 결과 출력하기
for c in data:
    print(c[0], c[1], c[2])