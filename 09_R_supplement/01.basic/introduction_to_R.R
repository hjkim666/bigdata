install.packages("xlsx")
library(xlsx)

help()
?hist
??hist

##########################################
#주석 
##########################################

3 + 3    #ctrl + 엔터 

  
x <- 3; y = 3

x <- y <- 6

x
y
x^2

x <- c(1,2,3,4)
x
x[1]
x[2]
x[3]
x[4]

x = 1:4
x

x <- 1:10
x
x*2
x

y <- x
x*2
y


mean(x)
median(x)
sd(x)
sum(x)
sqrt(x)

summary(x)

x<-c("Lincoln","Roosevelt","Jackson")
class(x)

x<-c(1.2, 1.5);
class(x)

x<-1:4
class(x)

x<-x>2
class(x)

m <- matrix(1:10, ncol=2)
m <- matrix(1:10, nrow=2)
m[1,2]
m

df <- data.frame(
  patientId=c("001","002","003"),
  treatment =c("drug","placebo","drug"),
  age=c(20,30,24)
  )
df
df[1,]
df[,3]
df$patientId
df$age

for(i in 1:5){
  print(i)
}

mat <- matrix(1:10,nrow=2,byrow=T)
mat
apply(mat, 2,sum)
apply(mat, 1,sum)
sum(mat)

install.packages("xlsx")
library(xlsx)

?solve
