nm = c("samuel", "aston", "patrick") 

mt = c(80, 90, 80) 

na = c(100, 90, 80)

sa = c(80, 80, 90)

df = data.frame(nm, mt, na, sa) 

row.names(df) <- df$nm

df



drops <- c("nm")

df <- df[,!(names(df) %in% drops)]

df

