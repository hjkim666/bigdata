import csv 

#파일을 열고, newline=''으로 줄바꿈 코드의 자동 변환을 제어합니다.
with open('top_city2.csv','w', newline='') as f:
    #csv.writer는 파일의 객체를 매개변수로 지정합니다. 
    writer = csv.writer(f)
    
    #첫번째 줄에 해더를 작성합니다.
    writer.writerow(['rank','city','population'])
    
    #writerows() 에 리스트를 전달하면 여러개의 값을 출력합니다. 
    writer.writerows([
        ['1','seoul','10000000'],
        ['2','pusan','5000000'],
        ['3','daegu','3000000']
        ])
    
    