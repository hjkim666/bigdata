#while expression
y <- c(3, 8)
x <- y/2
while (any(abs(x*x-y) > 1e-10)) x <- (x + y/x)/2
x

#repeat expression
y <- c(3, 8)
x <- y/2
repeat{
 x <- (x + y/x)/2
 if (any(abs(x*x-y) < 1e-10)) break
}

#for loop
for(i in 1:5){
   print(i)
}

#for loop
x <- seq(0, 1, 0.05)
plot(x, x, ylab="y", type="l")
for (j in 2:18) lines(x, x^j)
