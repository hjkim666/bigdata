##----------------------------------------------------------
## One-way ANOVA : aov(), oneway.test
##----------------------------------------------------------
##Are there any daily outcome differences among temperature conditions?
# group 1 : temperature condition 1 
# group 2 : temperature condition 2
# group 3 : temperature condition 3
# daily outcome by tmep condition (group 1/2/3)

group_df = read.csv("data/aov_data.csv", header=TRUE)
group_df <- transform(group_df, group = factor(group))
str(group_df)

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

 
