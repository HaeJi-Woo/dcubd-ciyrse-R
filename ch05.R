midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
str(midwest)
summary(midwest)

library(dplyr)
midwset <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)

midwest$ratio <- midwest$asian/midwest$total*100
hist(midwest$ratio)

mean(midwest$ratio)

midwest$group <- ifelse(midwest$ratio > 0.4872462, "large", "small")

tabel(midwest$group)
library(ggplot2)
qplot(midwest$group)
