# Goal: make charts 
# Andie Creel / Started January 2025 

library(readr)
library(dplyr) 
library(ggplot2)

# read in clean data 
myData <- read_csv("clean_data/my_clean_data.csv")

# quick data clean 
myData <- myData %>% 
  mutate(cyl = as.factor(cyl))

# histogram: distribution of a numeric variable 
ggplot(myData, aes(x=hwy)) +
  geom_histogram(binwidth = 2, fill = "black") +
  labs(title = "Distribution of Highway Miles per Gallon",
       x = "Highway Miles per Gallon", 
       y = "Count")

# box plot
ggplot(myData, aes(x = cyl, y = hwy)) + 
  geom_boxplot() + 
  labs(title = "MPG Distribution by Cylinder Count", 
       x = "Number of Cylinders", 
       y = "Highway Miles per Gallon")


# bar chart 
ggplot(myData, aes(x = manufacturer)) + 
  geom_bar(fill = "black") + 
  labs(title = "Count of obs by Manufacturer", 
       x = "Manufacturer", 
       y = "Count")

# scatter
ggplot(myData, aes(x = displ, y = hwy)) +
  geom_point() + 
  labs(title = "Engine Displacement vs Highway MPG", 
       x = "Engine Displacement (liters)", 
       y = "Highway Miles per Gallon")

# scatter; with a third axis of color 
ggplot(myData, aes(x = displ, y = hwy, color = manufacturer)) +
  geom_point() + 
  labs(title = "Engine Displacement vs Highway MPG", 
       x = "Engine Displacement (liters)", 
       y = "Highway Miles per Gallon")

# facet wrap
myFacet <- ggplot(myData, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~manufacturer)

myFacet


# line chart 
data("economics")

myLine <- ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line() +
  labs(title = "Unemployment through time", 
       x = "year", 
       y = "Unemployed (in thousands)")

# save 
ggsave("results/line_chart.png", 
       plot = myLine)

ggsave("results/my_facet.jpeg", 
       plot = myFacet, 
       width = 10, 
       height= 4,
       dpi = 300)

# polish our facet 
myFacet <- ggplot(myData, aes(x = displ, y = hwy)) +
  geom_point() +
  facet_wrap(~manufacturer) + 
  labs(title = "Engine Size vs MPG by Company", 
       x = "Engine Displacement (litres)",
       y = "MPG") +
  # theme_minimal()
  theme_bw() +
  theme(text = element_text(size = 20))

ggsave("results/my_facet.jpeg", 
       plot = myFacet, 
       width = 10, 
       height= 4,
       dpi = 300)


# polished bar chart 
ggplot(myData, aes(x = manufacturer)) + 
  geom_bar(fill = c("darkblue", "darkorange", "darkred")) +
  labs(title = "Num. of Obs by Manufacturer", 
       x = "Manufacturer", 
       y = "Count") +
  theme_minimal() +
  theme(text = element_text(size = 20))






















