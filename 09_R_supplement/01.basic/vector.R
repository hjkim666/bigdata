x <- c("Lincoln", "Roosevelt","Jackson")
x

x[2] <- NA
x

x[!is.na(x)]

x <- c(1.2, 1.5)
class(x)

x <- 1:4 
class(x)

x<-x>2
x
class(x)

myscore <- c(88, NA, 57, 97, 44, NA)
myscore
length(myscore)
length(na.omit(myscore))
myscore.sum <- sum(myscore, na.rm = TRUE)
myscore.sum
myscore.mean <- mean(myscore, na.rm = TRUE)
myscore.mean


amount <- c(0,2,1,1,2)
amount
amount.f1 <- factor(amount)
amount.f1

levels(amount.f1) <- c("L","M","H")
amount.f1

matrix(1:10, ncol=2)
matrix(1:10, nrow=2, byrow=TRUE)





df <- data.frame(
  patientID = c("001","002","003"),
  treatment  = c("drug", "placebo","drug"),
  age = c(20,30,24)
)
df

subset(df, treatment=="drug")

df$patientID
df$treatment



my.list <- list(
 fruits = c("orange", "banana","apple"),
 mat = matrix(1:10, nrow=2)
)
my.list

my.list$fruits
my.list$mat


i <- 1 
if(i == 1){
   print("i is equal 1")
} else {
  print("i is not equal to 1")
}

ifelse(i==1, "i is equal 1", "i is not equal to 1")


for(i in 1:5){
  print(i)
} 

mat <- matrix(1:10, nrow=2, byrow=TRUE)
apply(mat, 2, sum)
apply(mat, 1, sum)
