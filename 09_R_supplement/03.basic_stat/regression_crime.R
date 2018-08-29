#y=a+b1x1+b2x2+…+bnxn
# 다중회귀분석도 단순회귀분석과 동일한 절차에 의해 시행
# 수정된 결정계수 adj. r^2
# 독립변수들의 상대적 영향력의 크기 : 표준화 회귀계수
# 독립변수를 선택하는 방법 : 전진선택법, 후진선택법, 단계선택법
# 다중 공선성, 공차한계(tolerance), 분산팽창요인(VIF) : VIF가 10 이상이면 다중공선성 존재
install.packages("car")
library(car) #;options(digits=2)
str(state.x77)

states<-
  as.data.frame(state.x77[,c("Murder","Population","Illiteracy","Income","Frost")])
states
str(states)
states[,1]

fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
fit2 <- step(fit, direction="both")
summary(fit);summary(fit2)

par(mfrow=c(2,2))
plot(fit)

anova(fit, fit2) # 두 모형의 차이가 없는데 어떤 모형을 선택해야 하나요?
fit2;# 인구 500, 문맹률 1.5일 경우 살인사건 범죄는?
1.651550+0.000224*500+4.080737*1.5 # 방법 1
df<-data.frame(Population=500,Illiteracy=1.5)
predict(fit2,newdata=df) # 방법 2
vif(fit2);sqrt(vif(fit2))>2 # 다중 공선성 확인

install.packages("QuantPsyc")
library(QuantPsyc);lm.beta(fit2) # 표준화 계수 확인
#기본가정(선형성,오차항의 독립/정규/등분산성) 확인하세요.

