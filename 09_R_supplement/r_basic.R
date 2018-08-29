x <- 3 ;y = 3
x
x^2
x <- y <- 6
x
y

x = c(1,2,3,4)
x
x = 1:4 
x

x + 10
x[4]
x[1]

x > 2
#comment 

x[x>2]
x[1:3]

is.na(x)

x
cumsum(x)
summary(x)
class(x)

install.packages("ggplot2")
library(ggplot2)
?mpg
head(mpg)
str(mpg)
View(mpg)

unique(mpg$drv)
class(mpg$drv)
 
?ggplot2
??plot


x = c(1,1,1,2,3,3,3,4)
table(x)
hist(x)
boxplot(x)

x[x %in% c(1,2,5)]

y =c('a','b','c')
y[y %in% c("a")]

class("a")
class('a')



m1 = matrix(c(1:12), ncol=3)
m1
m1 = matrix(c(1:12), ncol=3, byrow = TRUE)
m1

m1[2,]
m1[,1]
m1[1,1]


df <- data.frame(
  patientID = c("001","002","003"),
  treatment = c("drug", "placebo","drug"),
  age = c(20,30,40)
)
df
subset(df, treatment =="drug")
df[1,]
df[,1]
df$age
df$treatment
str(df)
levels(df$treatment)
df$patientID = as.numeric(df$patientID)
df
str(df)


nrow(df)
ncol(df)
dim(df)
