#https://www.data.go.kr/dataset/3040486/fileData.do

import csv, codecs
# CSV 파일 열기
filename = "대륙별,경제권별 포함국가 및 구분부호 목록.csv"
fp = codecs.open(filename, "r")
# 한 줄씩 읽어 들이기
reader = csv.reader(fp, delimiter=",", quotechar='"')
for cells in reader:
    print(cells[0], cells[1], cells[2], cells[3], cells[4], cells[5])    