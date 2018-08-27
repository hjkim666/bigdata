import json 
from pprint import pprint
path = "my.json"

f = open(path, encoding='UTF8')

record = [json.loads(line) for line in f]
#print(record)
#print(record[0])
#pprint(record[0]['infoList'])
#pprint(record[0]['infoList'][0])
#pprint(record[0]['infoList'][0]['ingr_nm_lst'])
#pprint(record[0]['infoList'][0]['mufc_cntry_nm'])

for rec in record:
    for r in rec['infoList']:
        print("성분명은  %s, 국가명은 %s"%(r['ingr_nm_lst'], r['mufc_cntry_nm']))
