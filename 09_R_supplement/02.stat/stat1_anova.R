anova.samp<-read.csv("data/4_anova.csv")
# 1.정규성 검정
anova.samp
group1<-anova.samp[anova.samp==1,]
group2<-anova.samp[anova.samp$group==2,]
group3<-anova.samp[anova.samp$group==3,]
shapiro.test(group1$score)
shapiro.test(group2$score)
shapiro.test(group3$score)

# 2.등분산 검정
library(car)
leveneTest(anova.samp$score,factor(anova.samp$group))

# 3.분산분석
#oneway.test(anova.samp$score~factor(anova.samp$group))
a <- aov(anova.samp$score~factor(anova.samp$group))
summary(a)

# 4.사후 검정 (Tukey, bonferroni)
TukeyHSD(aov(anova.samp$score~factor(anova.samp$group)))
pairwise.t.test(anova.samp$score,factor(anova.samp$group),p.adjust.method="bonferroni")

# R에서도 다중비교 상황을 보정해서 0.05값 기준 결과 제시
boxplot(anova.samp$score~anova.samp$group)
