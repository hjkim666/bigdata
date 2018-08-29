df <- data.frame(
  patientID=c("001","002","003",
  treatment=c("drug","placebo"))
)

treat.pre <- c(54, 64, 75, 49, 52, 77, 94)
treat.post <- c(53, 60, 70, 49, 53, 70, 69)
dataset.t1 <- data.frame(Before=treat.pre, after=treat.post)
dataset.t1

dataset.t1$Before
dataset.t2 <- data.frame(treat.pre, treat.post)
dataset.t2
dataset.t2$treat.pre


dataset.t1
