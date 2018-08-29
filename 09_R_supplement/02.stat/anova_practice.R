##----------------------------------------------------------
## One-way ANOVA : aov(), oneway.test
##----------------------------------------------------------

##Are there any daily outcome differences among temperature conditions?
# group 1 : temperature condition 1 
# group 2 : temperature condition 2
# group 3 : temperature condition 3
 
# daily outcome by tmep condition (group 1/2/3)
y1 <- c(50.5, 52.1, 51.9, 52.4, 50.6, 51.4, 51.2, 52.2, 51.5, 50.8)
y2 <- c(47.5, 47.7, 46.6, 47.1, 47.2, 47.8, 45.2, 47.4, 45.0, 47.9)
y3 <- c(46.0, 47.1, 45.6, 47.1, 47.2, 46.4, 45.9, 47.1, 44.9, 46.2)

y <- c(y1, y2, y3)
y
#[1] 50.5 52.1 51.9 52.4 50.6 51.4 51.2 52.2 51.5 50.8 47.5 47.7 46.6 47.1 47.2 47.8 45.2 47.4 45.0
#[20] 47.9 46.0 47.1 45.6 47.1 47.2 46.4 45.9 47.1 44.9 46.2
n <- rep(10, 3)
n
#[1] 10 10 10
 
group <- rep(1:3, n)
group
#[1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3

# combining into data.frame
group_df <- data.frame(y, group)
group_df

sapply(group_df, class)
group_df <- transform(group_df, group = factor(group))
sapply(group_df, class)
str(group_df)

write.csv(group_df, file="aov_data.csv",row.names=TRUE)

#y     group 
#"numeric"  "factor" 
# boxplot
attach(group_df)
boxplot(y ~ group, 
       main = "Boxplot of Daily Outcome by Temperature condition 1/2/3", 
       xlab = "Factor Levels : Temperature condition 1/2/3", 
       ylab = "Daily Outcome")
# descriptive statistics by group
tapply(y, group, summary)
detach(group_df)
 
# one-wayANOVA
aov(y ~ group, data = group_df)
summary(aov(y ~ group, data = group_df))
#1.2e-13 < 0.05 귀무가설(모두분산이같다) 기각 
#각각 group 별로 유의미한 차이가 있다. 

bartlett.test(y ~ group, data = group_df)
leveneTest(y ~ group, data = group_df)
#등분산성가정에 대해  0.815 > 0.05 귀무가설 채택 
#등분산성을 만족한다.(모두 같다)
