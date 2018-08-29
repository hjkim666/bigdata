library(MASS)
Boston$chas <- as.factor(Boston$chas)

install.packages("caret")
install.packages("e1071")
library(caret)
prep <- preProcess(Boston, c("center", "scale", "BoxCox"))
df <- predict(prep, Boston)
df
#model <- lm("medv ~ . -1", data=df)
model <- lm("medv ~ .", data=df)
model
anova(model)

str(Boston)
