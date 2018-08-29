data <- read.csv("data/binary.csv")
str(data)
head(data)

data$rank <-as.factor(data$rank)
str(data)

train<-data[1:200, ]
test<-data[201:400, ]
model <- glm(admit ~ gre + gpa + rank, data =train, family = "binomial")
summary(model)

anova(model, test="Chisq")

library(pscl)
pR2(model)
