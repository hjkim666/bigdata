install.packages("AER")
data(Affairs, package="AER")
??Affairs

summary(Affairs)
table(Affairs$affairs)
Affairs$ynaffair[Affairs$affairs > 0] <- 1
Affairs$ynaffair[Affairs$affairs == 0] <- 0
Affairs$ynaffair <- factor(Affairs$ynaffair,levels=c(0,1),labels=c("No","Yes"))
table(Affairs$ynaffair)

#model1 
fit.full <- glm(ynaffair ~ gender + age + yearsmarried + children +religiousness
                + education + occupation +rating,data=Affairs,family=binomial())
summary(fit.full)

#model2
fit.reduced<-glm(ynaffair~age+yearsmarried+religiousness+rating,data=Affairs,
                 family=binomial());summary(fit.reduced)

anova(fit.reduced, fit.full, test="Chisq") # 두 모형은 차이가 없으므로 간결한 모형을 선택
coef(fit.reduced) # log(odds) 값이므로
?coef
exp(coef(fit.reduced)) # odds 값으로 전환
# 혼외 정사는 다른 요인을 상수로 고정시킬 경우 결혼연수가 1년 증가할 때마다 1.106배 증가한다.

exp(confint(fit.reduced))
testdata <- data.frame(rating=c(1, 2, 3, 4, 5)
                       , age=mean(Affairs$age)
                       , yearsmarried=mean(Affairs$yearsmarried)
                       , religiousness=mean(Affairs$religiousness))
testdata
testdata$prob<-predict(fit.reduced,newdata=testdata,type="response")
testdata
testdata <- data.frame(rating=mean(Affairs$rating)
                       ,age=seq(17, 57,10)
                       ,yearsmarried=mean(Affairs$yearsmarried)
                       ,religiousness=mean(Affairs$religiousness))
testdata
testdata$prob<-predict(fit.reduced,newdata=testdata,type="response")
testdata

testdata<-data.frame(rating=3, age=30, yearsmarried=3, religiousness=1)
testdata$prob<-predict(fit.reduced,newdata=testdata,type="response");testdata
summary(fit.reduced)
1-pchisq(675.38-615.36,4) # 모형의 적합도 검정

?pchisq
install.packages("ResourceSelection")
library(ResourceSelection)
hoslem.test(Affairs$ynaffair,fitted(fit.reduced)) # 모형의 적합도 검정

##################
install.packages("pscl")
library(pscl)
pR2(fit.reduced)
#Mcfadden R2으로 모델 fit - 선형회귀의 R-square와 같은 개

