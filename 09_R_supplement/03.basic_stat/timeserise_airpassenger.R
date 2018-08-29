str(AirPassengers)
AirPassengers
plot(AirPassengers)
plot(stl(AirPassengers, s.window="periodic"))

install.packages("tseries")
library(tseries)

adf.test(diff(log(AirPassengers)), alternative = "stationary",k=0)

?adf.test
install.packages("forecast")
library(forecast)

auto.arima(diff(log(AirPassengers)))

tsdiag(auto.arima(diff(log(AirPassengers))))

# model 
fit <- arima(log(AirPassengers), c(1,0,1),
             seasonal = list(order=c(0,1,1), period=12))
summary(fit)
pred <- predict(fit, n.ahead=10*12)
ts.plot(AirPassengers, 2.718^pred$pred, log ="y", lty=c(1,3) )
# e = 2.718 

fit2 <- arima(log(AirPassengers), c(1,0,1),
             seasonal = list(order=c(0,1,1), period=12))
summary(fit2)

fit3 <- arima(log(AirPassengers), c(1,0,1))
summary(fit3)
?arima



auto.arima(log(AirPassengers))
