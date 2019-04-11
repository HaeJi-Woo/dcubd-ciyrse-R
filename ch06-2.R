install.packages("dplyr")
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
exam %>% arrange(desc(math))
exam %>% arrange(class, math)
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>% 
  head(5)