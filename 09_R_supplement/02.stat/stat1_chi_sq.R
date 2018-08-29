#카이제곱 검정 sum{(관측빈도-기대빈도)^2 / 기대빈도}
chi_data<-read.csv("data/5_chisq.csv", sep=",",header=T)
chi_data
str(chi_data)

attach(chi_data)
chi_table<-xtabs(~obesity+diabetes)

chi_table # 1 비만체중, 2 정상체중, 1 당뇨, 2 정상
chisq.test(chi_table)$expected
chisq.test(chi_table)
install.packages("vcd")
library(vcd)
oddsratio(chi_table)
exp(oddsratio(chi_table)$coefficients)
# 비만 체중인 사람이 당뇨가 있을 가능성은 정상 체중인의 4.3배

female<-c(18,102)
# 여성 120명중 편두통이 있음 18명, 편두통 없음 102명
male<-c(10, 110)
# 남성은 편두통 있음 10명, 편두통 없음 110명
#편두통과 성별발병률과 어떤 관련이 있는가?
migraine<-cbind(female,male)
migraine;chisq.test(migraine)
