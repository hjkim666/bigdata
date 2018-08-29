sample<-read.csv("data/bmi.csv",sep=",",header=T)


library(ggplot2)
ggplot(sample,aes(waistline, BMI))+geom_point()+geom_smooth(method=lm)

plot(sample$waistline,sample$BMI)
ggplot(sample,aes(waistline, BMI))+geom_point()

sample
lm_sample<-lm(BMI~waistline, data=sample)

summary(lm_sample) # 회귀식, 설명력, 회귀계수 확인
par(mfrow=c(2,2))
plot(lm_sample)

resid<-resid(lm_sample);qqnorm(resid);qqline(resid)
plot(resid) # 기본 가정 검정

# waistline이 130일 경우 BMI는?
newdata = data.frame(waistline=130)
predict(lm_sample, newdata, type="response")

plot(sample$waistline,sample$BMI)
abline(lm_sample)
