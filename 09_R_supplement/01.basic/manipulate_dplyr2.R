#########################################################
#데이터 가공  - 원하는 형태로 데이터 가공하기 
# 데이터 전처리 페키지 - dplyr 패키지 
#함수	기능
#filter()	행 추출
#select()	열(변수) 추출
#arrange()	정렬
#mutate()	변수 추가
#summarise()	통계치 산출
#group_by()	집단별로 나누기
#left_join()	데이터 합치기(열)
#bind_rows()	데이터 합치기(행)
#########################################################
#조건에 맞는 데이터만 추출 (Filter)
#########################################################
library(dplyr)
exam <- read.csv("data/csv_exam.csv")

exam %>% filter(class == 1)

exam %>% filter(class == 2)

#class이 1이 아닌경우 
exam %>% filter(class != 1)
#class 3이 아닌경우 
exam %>% filter(class != 3)

# math가 50초과 경우 
exam %>% filter(math > 50)

# math가 50미만 경우 
exam %>% filter(math > 50)

# 2가지 조건 충족 (class 1이면서 math가 50이상)
exam %>% filter(class ==1 & math >= 50)
exam %>% filter(math >= 90 | english >= 90)

# 2가지 이상의 조건 
exam %>% filter(class %in% c(1,3,5))

#추출한 행으로 데이터 만들기 
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)
mean(class2$math)
#################################################
# 필요한 변수만 추출 select 함수 
# 데이터프레임명 %>% select(컬럼명)
#################################################
exam %>% select(math)
exam %>% select(english)

#여러변수 추출 
exam %>% select(class, math, english)

#변수를 제외 
exam %>% select(-math)
exam %>% select(-math, english)

#특정행 추출후 열 추출 
exam %>%  filter(class==1) %>% select(english)

#가독성 
exam %>%  
  filter(class==1) %>% 
  select(english)

#일부만 추출 
exam %>% 
  select(id, math) %>% 
  head

#정렬 (오름차순)
exam %>% arrange(math)

#정렬 (내림차순) 
exam %>% arrange(desc(math))

#정렬(여러개 변수지정) 
exam %>% arrange(class, math)

#################################################
#파생변수 추가하기 (mutate())
#################################################
exam %>%  
  mutate(total = math + english + science) %>% 
  head

# 여러개 파생변수 추가 
exam %>% 
  mutate(total = math + english + science, 
         mean = (math + english + science)/3) %>%  
  head

# mutate()에 ifelse적용 
exam %>% 
  mutate(test=ifelse(science >=60 , "pass","fail")) %>% 
  head

#변수추가 + 정렬 + 일부추출 
exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

#################################################
# 집단별 요약하기 (summarise())
#################################################
exam %>% summarise(mean_math = mean(math))

#반별평균
exam %>%  
  group_by(class) %>% 
  summarise(mean_math = mean(math))

# 요약통계량 한번에 산출 
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math), 
            sum_math = sum(math),
            median_math = median(math),
            n = n())

#자주 사용하는 요약통계량 함수
#mean()	평균
#sd()	표준편차
#sum()	합계
#median()	중앙값
#min()	최솟값
#max()	최댓값
#n()	빈도

# 2가지 컬럼에 group by 적용 
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

#################################################
# 열 합치기 (join())
#################################################
test1 <- data.frame(id=c(1,2,3,4,5), 
                    midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id=c(1,2,3,4,5),
                    final = c(70, 83, 65, 95, 80))

test1
test2

# id 기준으로 합치기 
total <- left_join(test1, test2, by="id")
total

# 반별 담임교사 명단 
name <- data.frame(class=c(1,2,3,4,5),
                   teacher=c("kim", "lee", "park", "choi", "jung"))
name

#클래스 기준 합치기 
exam_new <- left_join(exam, name, by = "class")
exam_new

# 행 합치기 
group_a <- data.frame(id = c(1,2,3,4,5), 
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70, 83,65,95,80))
group_a
group_b

group_all <- bind_rows(group_a, group_b)
group_all

