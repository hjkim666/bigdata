#***************************************************************
# 요인(Factors)
#***************************************************************
water.amount <- c(0, 2, 1, 1, 2)
water.amount
water.amount.f1 <- factor(water.amount)
water.amount.f1

levels(water.amount.f1) <- c("L", "M", "H")
water.amount.f1

water.amount.n <- as.numeric(water.amount.f1)
water.amount.n

water.amount.t <- c("L", "H", "M", "M", "H")

water.amount.f2 <- factor(water.amount.t)
water.amount.f2
c
water.amount.f4 <- factor(water.amount.t, levels=c("L", "M", "H"))
water.amount.f4
