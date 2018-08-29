#분포
#분포 : 관측치들의 집합적 양상, 확률분포, (정규분포 T분포 F분포 카이제곱 분포)
x=rnorm(100)
hist(x,probability=TRUE,col=gray(.9),main="normal mu=0,sigma=1", ylim=c(0,0.5))
curve(dnorm(x),add=T) # 정규분포

# 카이제곱 분포
x=rchisq(100,5)
hist(x,probability=T,ylim=c(0,0.2))
curve(dchisq(x,5),add=T) 
 
# 자료의 탐색
install.packages("UsingR")
library(UsingR);library(psych)
x=c(6,10,12,12,15,21,22,33,37)
simple.eda(x)
describe(x)
?psych
?describe
# 확인 사항
#1. 자료의 분포 형태를 파악하고,
#2. 평균과 중앙값의 차이가 크지 않은지,
#3. 왜도와 첨도값이 -2~+2사이에 위치하는 지 확인

# 정규성 검정
norm<-read.csv("data/1_normality.csv",sep=",",header=T)
group1<-norm[norm$group==1,]
group2<-norm[norm$group==2,]

shapiro.test(group1$score)
shapiro.test(group2$score) # 방법 1
par(mfrow=c(1,2))
hist(group1$score);hist(group2$score)

qqnorm(group1$score);qqline(group1$score) # 방법 2

install.packages("psych")
library(psych)
describe(group1$score)
describe(group2$score) # 방법 3

?describe

1 - pnorm(1.66)
dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)
