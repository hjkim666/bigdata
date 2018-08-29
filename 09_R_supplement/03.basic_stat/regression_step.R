mtcars
?mtcars

model <- lm(am~., data=mtcars)


step(model, direction="forward")
step(model, direction="backward")
step(model, direction="both")
