# Goal: Data cleaning 
# Andie Creel / Started January 2025

library(dplyr)
library(readr)
library(ggplot2)

# load in my data set
myData_og <- read_csv("raw_data/mpg.csv")

# clean data 
myData <- myData_og %>%
  filter(manufacturer == "ford" | manufacturer == "dodge" | manufacturer == "toyota") %>% 
  select(-fl) %>% 
  mutate(cyl = as.factor(cyl))

# write data 
write_csv(file = "clean_data/my_clean_data.csv", x = myData)



