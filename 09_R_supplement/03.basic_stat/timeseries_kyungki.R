#==========================================================
#		시계열 분석  					
#==========================================================
install.packages("astsa")
require(astsa)
data(jj)
plot(jj, ylab="Earnings per share", main="J&J")

# log transform
dljj<-diff(log(jj))
plot(log(jj), main="log(jj)", ylab="log(Earnings)")


# Set up the graphics
par(mfrow=c(2,1))

# histogram
hist(dljj,prob=TRUE,12)

# Smooth it (density for details)
lines(density(dljj))

#normal Q-Q plot
qqnorm(dljj)
qqline(dljj)

# lag plot
lag.plot(dljj,9,do.lines=FALSE)


# 분해
dog<-stl(log(jj),"per")
plot(dog)

Q<-factor(cycle(jj))

# not necessary to "center" time
# but the results look nicer
trend <- time(jj)-1970

# run the regression without an intercept
# the na.action statement is to retain time
reg <- lm(log(jj)~0+trend+Q,na.action=NULL)
summary(reg)

# plot
plot(spline(time(jj), log(jj)), type="l", xlab="Time", ylab="log(jj)")
lines(reg$fit, col="red")

# 잔차 plot
plot(resid(reg))

# acf plot
acf(resid(reg))

# exam2
# data
x<-arima.sim(list(order=c(1,0,1),ar=0.9, ma=-0.5),n=100)

# model fitting
x.fit <- arima(x,order=c(1,0,1))
x.fit


#==========================================================
#		시계열 분석  					
#==========================================================
data <- read.table(file("data/time_data.txt"), header = TRUE)
head(data)
ts.plot(data)

par(mfrow=c(1,2))
acf(data) 
pacf(data)

#차분
diff <- diff(data.matrix(data))
ts.plot(diff)

acf(diff)
pacf(diff)

#ARIMA model에 fitting하여 각각 AIC 값들을 계산
aic <- matrix(c(1:16), ncol=4)
for (i in 0:3){
  for (j in 0:3){
    fit <- arima(data,order=c(i,1,j))
    aic[i+1,j+1] <- fit$aic
  }
}
aic 

#fit ARIMA(2,1,1) model
fit <- arima(data, order=c(2,1,1))
fit

# predict
p <- predict(fit, n.ahead=10)
p

#Plot the predicted values with 95% prediction interval
ts.plot(data, xlim=c(1,210))
lines(p$pred,col="red")
lines(p$pred+1.96*p$se,col="blue",lty=3)
lines(p$pred-1.96*p$se,col="blue",lty=3)

#check the model assumption
#tsdiag를 통해 시간에 따른 residual의 평균이 0인지
#그것들의 분산이 크게 변하지는 않는지
#residual의 acf값이 모두 0을 갖는지
#그리고 그게 대한 p-value값들이 모두 충분히 큰 값(0.5보다 큰 값)을 갖는지
#또 qqline을 이용하여 정규성을 확인 

tsdiag(fit)
qqnorm(fit$resid)
qqline(fit$resid)

#==========================================================
#		시계열 분석  					
#==========================================================
temp.data <- read.table(file("data/temp_dubuque.txt"), header = FALSE)
ts.plot(temp.data)

par(mfrow = c(1,2))
acf(temp.data)
pacf(temp.data)

# 계절 차분
sdiff <- diff(data.matrix(temp.data), lag=12)
ts.plot(sdiff)

par(mfrow = c(1,2))
acf(sdiff)
pacf(sdiff)

# 차분
diff <- diff(data.matrix(sdiff))
ts.plot(diff)

par(mfrow = c(1,2))
acf(diff)
pacf(diff)

#Seasonal ARIMA (0,1,1), lag=12로 두고, 
#ARIMA model에서는 d=1을 둔 채로 aic를 구하기

aic <- matrix(c(1:16), ncol=4)
for (i in 0:3){
  for (j in 0:3){
    fit <- arima(temp.data,order=c(i,1,j), seasonal=list(order=c(0,1,1), period=12))
    aic[i+1,j+1]=fit$aic
  }
}
aic

#fit SARIMA(0,1,3)×(0,1,1) model
fit <- arima(temp.data,order=c(0,1,3), seasonal=list(order=c(0,1,1), period=12))
fit

# predict one year ahead
p <- predict(fit, n.ahead=12)
p

# Plot the predicted values with 95% prediction interval
ts.plot(temp.data, xlim=c(1,155), ylim = c(0, 100))
lines(p$pred,col="red")
lines(p$pred+1.96*p$se,col="blue",lty=3)
lines(p$pred-1.96*p$se,col="blue",lty=3)


#check the model assumption
#tsdiag를 통해 시간에 따른 residual의 평균이 0인지
#그것들의 분산이 크게 변하지는 않는지
#residual의 acf값이 모두 0을 갖는지
#그리고 그게 대한 p-value값들이 모두 충분히 큰 값(0.5보다 큰 값)을 갖는지
#또 qqline을 이용하여 정규성을 확인 

tsdiag(fit)
qqnorm(fit$resid)
qqline(fit$resid)
###

fit1=arima(temp.data, order=c(0,1,3), seasonal=list(order=c(0,1,1),period=12), method="CSS")
fit1



# predict one year ahead
p <- predict(fit1, n.ahead=12)
p

# Plot the predicted values with 95% prediction interval
ts.plot(temp.data, xlim=c(1,155), ylim = c(0, 100))
lines(p$pred,col="red")
lines(p$pred+1.96*p$se,col="blue",lty=3)
lines(p$pred-1.96*p$se,col="blue",lty=3)

#model diagnostic(check the model assumption)

tsdiag(fit1)
qqnorm(fit1$resid)
qqline(fit1$resid)

