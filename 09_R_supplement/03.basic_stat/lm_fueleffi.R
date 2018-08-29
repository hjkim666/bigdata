#######################################################
# multiple regression - fuelEfficiency 
#######################################################

fuel<-read.csv("data/FuelEfficiency.csv")
str(fuel);fuel$ET<-as.factor(fuel$ET)
str(fuel)
str(mtcars)
names(fuel)<-tolower(names(fuel));names(fuel)
cor.fuel<-cor(fuel[,-8])
cor.fuel<-round(cor.fuel,digits=2)
library(corrplot)
corrplot(cor.fuel,method="shade",addCoef.col="black")
fuel2<-fuel[-2]
m1<-lm(mpg~.,data=fuel2)
summary(m1)
m2<-lm(mpg~dis+nc+hp+et,data=fuel2)
summary(m2)
m3<-lm(mpg~nc+hp+et,data=fuel2)
summary(m3)
library(car);vif(m3) # 답 3   10이상이면 다중공선성 
resid<-resid(m3) 
qqnorm(resid);qqline(resid);shapiro.test(resid)  #정규성
plot(resid) 
install.packages("QuantPsyc")
library(QuantPsyc);lm.beta(m3) # 답 5

# 변수 추출 방법
library(randomForest)
rf<-randomForest(et~.,data=fuel2,importance=T)
rf
importance(rf)
plot(rf)
varImpPlot(rf)
