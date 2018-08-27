import csv 

with open('top_city3.csv','w') as f: 
    #첫번째 매개변수에 파일 객체 
    #두번째 매개변수에 필드 이름 리스트를 지정합니다. 
    writer = csv.DictWriter(f, ['rank','city','population'])
    #첫번째 줄에 헤더를 입력합니다. 
    
    writer.writeheader()
    
    #writerows()로 여러개의 데이터를 딕셔너리 형태로 작성합니다.
    writer.writerows([
        {'rank':1, 'city':'seoul', 'population':'10000000'},
        {'rank':2, 'city':'pusan', 'population':'5000000'},
        {'rank':3, 'city':'daegu', 'population':'3000000'}
        ])