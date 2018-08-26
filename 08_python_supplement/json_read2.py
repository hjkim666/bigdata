import json

with open('customer.json') as data_file:    
    data = json.load(data_file)

#data는 json 전체를 dictionary 형태로 저장하고 있음
print(data) 

print(data["name"])
print(data["address"])
print(data["items"][0]["id"])
