install.packages("dplyr")
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
exam %>% summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty)) %>%
  head(10)

mpg %>%
  group_by(manufacturer) %>%
  filter(class == "suv") %>%
  mutate(tot = (cty+hwy)/2) %>%
  summarise(mean_tot = mean(tot)) %>%
  arrange(desc(mean_tot)) %>%
  head(5)

mpg <- as.data.as(ggplot2)
mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) 

mpg %>% group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

mpg %>% filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n()) %>%
  arrange(desc(count))
  