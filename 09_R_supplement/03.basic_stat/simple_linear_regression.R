#상관분석
x=c(4,6,6,8,8,9,9,10,12,12)
y=c(39,42,45,47,50,50,52,55,57,60)
cor(x,y)



#단순회귀분석 

x=c(4,6,6,8,8,9,9,10,12,12)
y=c(39,42,45,47,50,50,52,55,57,60)
lm(y~x)

lm.result=lm(y~x)
summary(lm.result)

#회귀모형의 정도 
plot(x,y)
abline(lm.result)
resid(lm.result)

fitted(lm.result)

predict(lm.result, data.frame(x=c(7,15,20)))

par(mfrow=c(2,2))
plot(lm.result)
