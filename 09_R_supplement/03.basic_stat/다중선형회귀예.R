mtcars
str(mtcars)

result <- lm(mpg~wt+hp+am+gear+carb , data=mtcars)
summary(result)
