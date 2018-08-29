library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
dim(mpg)

# dplyr

install.packages("dplyr")
library(dplyr)

df_raw <- data.frame(var1=c(1,2,1),
                     var2=c(2,3,2))
df_raw

#컬럼명 변경 
df_new <- rename(df_raw, v2=var2)
df_new

##################################
# 파생변수 만들기 
##################################
df <- data.frame(var1=c(4,3,8),
                 var2=c(2,6,1))
df

df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1 + df$var2)/2
df

# 통합연비 변수 만들기 
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
?ggplot2::mpg

# 조건문을 활용해 파생변수 만들기 
summary(mpg$total)
hist(mpg$total)

mpg$test <- ifelse(mpg$total >=20, "pass", "fail")
head(mpg)

#빈도 표
table(mpg$test)

library(ggplot2)

#막대그래프 표현 
qplot(mpg$test)

#중첩조건문활용 - 연비등급변수 만들기 
#등급 total 기준 
#A 30이상 
#B 20~29 
#C 20미만 

mpg$grade <- ifelse(mpg$total > 30, "A", 
                    ifelse(mpg$total > 20, "B", "C"))
head(mpg)

table(mpg$grade)



