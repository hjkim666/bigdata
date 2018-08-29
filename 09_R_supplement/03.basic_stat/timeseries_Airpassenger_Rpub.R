#https://rpubs.com/nohaelprince/47545
library(forecast)
data(AirPassengers)
AP <- AirPassengers
AP

class(AP)
start(AP); end(AP); frequency(AP)

summary(AP)

plot(AP, ylab= "Passengers (1000's)")

plot(decompose(AirPassengers)) # time series decomposition

apts <- ts(AirPassengers, frequency=12)
f<- decompose(apts)

library(tseries)
adf.test(apts, alternative ="stationary", k=12)

findbest <- auto.arima(AirPassengers)
findbest #Check the arma values: [1]  0  1  0  0 12  1  1

plot(forecast(findbest,h=20))
fit <- arima(AirPassengers, order=c(0, 1, 1), list(order=c(0, 1, 0), period = 12))
fit

fit <- arima(AirPassengers, order=c(2, 1, 1), list(order=c(0, 1, 0), period = 12))


fore <- predict(fit, n.ahead=24)
# calculate upper (U) and lower (L) prediction intervals
U <- fore$pred + 2*fore$se # se: standard error (quantile is 2 as mean=0)
L <- fore$pred - 2*fore$se
# plot observed and predicted values
ts.plot(AirPassengers, fore$pred, U, L, col=c(1, 2, 4, 4), lty=c(1, 1, 2, 2))
library(graphics)
legend("topleft", c("Actual", "Forecast", "Error Bounds (95% prediction interval)"), 
       col=c(1, 2, 4),lty=c(1, 1, 2))

res <- residuals(fit)  # get residuals from fit
# check acf and pacf of residuals
acf(res)

pacf(res)
# qqnorm is a generic function the default method of which produces a normal QQ plot of the values in y. qqline adds a line to a “theoretical”, by default normal, quantile-quantile plot which passes through the probs quantiles, by default the first and third quartiles.
qqnorm(residuals(fit))
qqline(residuals(fit))

library(tseries)
adf.test(fit$residuals, alternative ="stationary")

