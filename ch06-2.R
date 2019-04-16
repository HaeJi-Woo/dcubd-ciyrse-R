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

exam %>%
  mutate(total = math + english + science) %>%
  head
exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>%
  head
exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total) %>%
  head

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg
mpg_new <- mpg_new %>% mutate(total = cty + hwy)
mpg_new <- mpg_new %>% mutate(mean = total/2)
mpg_new %>%
  arrange(desc(mean)) %>%
  head(3)
mpg %>%
  mutate(total = cty + hwy, 
         mean = total/2) %>%
  arrange(desc(mean)) %>%
  head(3)
