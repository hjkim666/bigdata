import json 

with open('my.json', encoding='UTF8') as data_file:    
    data = json.load(data_file)
    
print(data['infoList'])

for r in data['infoList']:
        print("성분명은  %s, 국가명은 %s"%(r['ingr_nm_lst'], r['mufc_cntry_nm']))
        
#result = [r['ingr_nm_lst'] for r in data['infoList']]   
#print(result)     
