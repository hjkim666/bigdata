#변수 형태에 따른 통계분석이 적용됨 
# 상관분석
x = iris

plot(x) # 모든 변수의 연관성을 산포도로 보기
cor(x) # 모든 변수간 상관관계 보기
cor.test(x$Sepal.Length, x$Petal.Length) # 두변수간 상관관계의 유의성 확인
library(psych)
corr.test(x[-5]) # 모든 변수간 상관관계 및 유의성 확인

################################################
data(iris)
t.test(iris$Sepal.Length, mu=5.8)
# 귀무가설 : 세팔 길이의 모평균은 5.8이다
t.test(iris$Sepal.Length, mu=5.8,
       conf.level=0.99)
setosa<- subset(iris,select=Sepal.Length,Species=="setosa")
virginica<-subset(iris,select=Sepal.Length,Species=="virginica")
t.test(setosa,virginica)

t.test(y~x, data) # y numeric, x dichotomous
t.test(y1,y2) # both numeric

# norm 자료를 가지고 독립 t 검정을 해 보세요.
# 등분산 검정 (귀무가설 : 두 군의 분산은 같다)
norm<-read.csv("data/1_normality.csv",sep=",",header=T)
group1<-norm[norm$group==1,]
group2<-norm[norm$group==2,]
t.test(group1, group2)

library(car)
leveneTest(norm$score,factor(norm$group)) 
t.test(norm$score~factor(norm$group))
