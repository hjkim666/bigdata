###############################################
# Missing value 등 데이터 정제
###############################################
df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score=c(5,4,3,4,NA))
df

is.na(df)

table(is.na(df))

#변수별 결측치확인 
table(is.na(df$sex))

table(is.na(df$score))

#결측치 포함상태로 분석 
mean(df$score)
sum(df$score)

#결측치 있는 행 제거 
library(dplyr)
df %>% filter(is.na(score))    #NA인 데이터만 출력

df %>% filter(!is.na(score))  #score 결측치 제거 

df_nomiss <- df %>% filter(!is.na(score)) 
mean(df_nomiss$score)
sum(df_nomiss$score)

#여러변수에 동시에 결측치 없는 데이터 추출 
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

#결측치가 하나라도 있으면 제거 
df_nomiss2 <- na.omit(df)
df_nomiss2

#결측치 제외 기능  
mean(df$score, na.rm=T)
sum(df$score, na.rm=T)

# summarise()에서 na.rm=T 사용 
exam <- read.csv("data/csv_exam.csv")
exam[c(3,8,15), "math"] <- NA

exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = mean(math, na.rm = T),
                   median_math = mean(math, na.rm = T))

# 결측값 대체 
# 평균으로 대체 
mean(exam$math, na.rm=T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))

##################################################
# Outlier 제거 
# 존재할수 없는 값 : 결측처리(NA)
# 극단적인 값 : 정상범위기준에서 결측처리 
################################################## 
#이상치 제거 - 존재할수 없는값 

outlier <- data.frame(sex=c(1,2,1,3,2,1), 
                      score=c(5,4,3,4,2,6))
outlier

table(outlier$sex)
table(outlier$score)

#결측처리 
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

#결측 제외후 분석 
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

#극단적인 값 
# 상하위 0.3% 극단치 또는 상자그림 1.5 IQR 벗어나면 극단치
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)

#상자 밖 가로선	극단치 경계	Q1, Q3 밖 1.5 IQR 내 최대값
#상자 밖 점 표식	극단치	Q1, Q3 밖 1.5 IQR을 벗어난 값
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37 , NA, mpg$hwy)
table(is.na(mpg$hwy))

#결측치 제외후 분석 
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))
