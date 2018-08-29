weight <- c(94,83,80,67,73,69)
weight
height <- c(1.73,1.82,1.70,1.69,1.84,1.77)
height
BMI <- weight / height^2
mean(weight)    #평균
var(weight)        #분산
sd(weight)         #표준편차

t.test(BMI, mu=22.5)
result <- t.test(BMI, mu=22.5)
result$p.value    #특정변수의 이름만 가져올 수 있음



#시각화
plot(height, weight, pch=3)
x <- sort(height)
lines(x, 22.5*x^2)
height 
x 

result
