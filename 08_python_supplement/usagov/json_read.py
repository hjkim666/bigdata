import json
from pprint import pprint

with open('top_city.json') as data_file:    
    data = json.load(data_file)

#data는 json 전체를 dictionary 형태로 저장하고 있음
pprint(data) 
pprint(data[0]["city"])
