exam <- read.table("data/exam1.txt", header=T)
exam
class(exam)
exam$score
stem(exam$score)

attach(exam)
score
stem(score)
detach(exam)

str(exam)
stem(score, scale=2)

hist(score)

summary(score)[-4]

quantile(score, c(1/2, 1/4, 1/8, 1/16))



ku <- read.csv("data/광역시-구 인구.csv")
ku
str(ku)
attach(ku)
boxplot(인구~지역명)


shi <- reorder(지역명, 지역코드)
boxplot(인구~shi)

boxplot(인구~shi, width=table(shi))

table(shi)
