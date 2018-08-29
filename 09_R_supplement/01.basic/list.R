my.list <- list(
  fruits = c("orange", "bananas", "apples"),
  mat = matrix(1:10, nrow=2)
  )
my.list
my.list$fruits
my.list$mat


#################################################################
#  복합 벡터 생성함수(list): 벡터 개체를 개별 요소로 합성
#################################################################
diet.pre <- c(54, 64, 75, 49, 52, 77, 94)
diet.post <- c(53, 60, 70, 49, 53, 70, 69)
diet1 <- list(Before=diet.pre, After=diet.post)
diet1
$Before
$After
diet1$Before
diet2 <- list(diet.pre, diet.post)
diet2
diet2[1]
diet2$diet