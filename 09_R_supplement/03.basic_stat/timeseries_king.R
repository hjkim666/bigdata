##################################################
# 영국의 역대 왕들의 수명 
##################################################
kings<-scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
kings <- read.csv("data/kings.csv", Header=F)
kings
str(kings)

kings.ts <- ts(kings)
kings.ts

births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
write.csv(births, "data/birth.csv")

# decomposing non-seasonal data (trend+irregular component)
library(TTR)
king.ts.sma3<-SMA(king.ts,n=3)
plot.ts(king.ts.sma3) # 최초 플랏과 비교해 보세요.
king.ts.sma8<-SMA(king.ts,n=8) # 주기는 시행착오 필요
plot.ts(king.ts.sma8) # 단순이동평균으로 불규칙 변동을 제거하고 트렌드를 살펴봄
# 20번째 왕까지는 38세에서 55까지 수명유지하고 그 이후부터는 수명이 늘어서 40번재 왕은 73세까지 생존
library(forecast);forecast(king.ts.sma8,h=3)
plot(forecast(king.ts.sma8,h=3))
!
  # decomposing seasonal data (trend+seasonal+irregular)
  birth.ts.comp<-decompose(birth.ts)
birth.ts.comp
plot(birth.ts.comp)
# seasonally adjusting
birth.ts.sea.adj<-birth.ts-birth.ts.comp$seasonal
plot(birth.ts.sea.adj) # now trend+irregular component
forecast(birth.ts.sea.adj,h=12)
plot(forecast(birth.ts.sea.adj,h=12))