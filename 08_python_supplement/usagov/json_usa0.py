import json 
path = "usagov_bitly_data2012-03-16.txt"

f = open(path, encoding='UTF8')

# all = []
# for x in f.readlines():
#     all.append(x)
# 
# print(all)    
#a = json.loads(f.readlines())
#print(a)

record = [json.loads(line) for line in f]
print(record)
print(record[0])
print(record[0]['tz'])