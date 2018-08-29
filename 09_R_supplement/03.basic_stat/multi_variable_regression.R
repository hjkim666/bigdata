install.packages("reshape") 
library(reshape) 

result <- read.csv("data/my_regression.csv", header=FALSE)
result
str(result)
View(result) 
result <- rename(result, c(V1="total", V2="price", V3="period", V4="variety"))
View(result) 
result2 <- lm(total ~ price + period + variety, data=result) 
result2
summary(result2)



