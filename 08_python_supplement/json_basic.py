import json 

city = [
    {'rank':1, 'city':'seoul', 'pupulation':10000000},
    {'rank':2, 'city':'pusan', 'pupulation':5000000},
    {'rank':3, 'city':'daegu', 'pupulation':3000000}]

# JSON 형식으로 문자열 출력 
print(json.dumps(city))

# 사람이 읽기 쉬운 형식으로 출력. ASCII 이외의 문자열을 \uxxxx 형태로 이스케이프하지 않고 출력 
# indent=2  적절한 위치에서 줄바꿈 될떄마다 2개의 공백으로 들여쓰기를 해줌
print(json.dumps(city, ensure_ascii=False, indent=2))

# JSON을 파일로 출력 
with open('top_city.json','w') as f:
    json.dump(city, f)
    