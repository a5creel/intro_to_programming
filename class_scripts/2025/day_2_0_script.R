# Goal: day 2 examples for programming workshop 
# Andie Creel / Started January 2025 

library(dplyr)
library(tidyr)
library(ggplot2)

# ------------------------------------------------------
# Built datasets
# ------------------------------------------------------

myBase <- data.frame(
  name = c("Andie", "Bridger", "Scott"),
  gender = c("Female", "non-binary", "Male"),
  male = c(F, F, T), 
  income_cat = c("middle", "poor", "rich"),
  park_dist = c(1, 0.5, 0.1)
)

myDplyr <- myBase 

identical(myBase, myDplyr)

# ------------------------------------------------------
# manipulate a column 
# ------------------------------------------------------

# base R 
for(i in 1:3){
  myBase$park_dist[i] <- myBase$park_dist[i] + 1
}

identical(myBase, myDplyr)


# dplyr 
myDplyr <- myDplyr %>%
  mutate(park_dist = park_dist + 1)

identical(myBase, myDplyr)


# base r: create new column
for(i in 1:3){
  myBase$park_dist_new[i] <- myBase$park_dist[i] + 1
}

# dplyr: create new column
myDplyr <- myDplyr %>% 
  mutate(park_dist_new = park_dist+1)

identical(myBase, myDplyr)

# ------------------------------------------------------
# manipulate a column 
# ------------------------------------------------------

# base R 
for (i in seq_along(myBase$male)) {
  if(myBase$male[i] == FALSE){
    myBase$park_dist_correct[i] <- myBase$park_dist[i] - 0.25
  }else{
    myBase$park_dist_correct[i] <- myBase$park_dist[i]
  } 
}

# dplyr 
myDplyr <- myDplyr %>% 
  mutate(park_dist_correct = if_else(male == F, park_dist - 0.25, park_dist))


identical(myBase, myDplyr)

# ------------------------------------------------------
# Build new dataset
# ------------------------------------------------------

df_env_data <- data.frame(
  ecosystem = c("Forest", "Desert", "Wetland", "Grassland", "Urban"),
  species_richness = c(120, 45, 80, 60, 30),
  pollution_level = c("Low", "High", "Medium", "Low", "High")
)

# filter
low_pollution_data <- df_env_data %>% 
  filter(pollution_level == "Low")
low_pollution_data


# ------------------------------------------------------
# Build new dataset with NAs
# ------------------------------------------------------

df_env_data_na <- data.frame(
  ecosystem = c("Forest", "Desert", "Wetland", NA, "Urban"),
  species_richness = c(120, 45, 80, 60, 30),
  pollution_level = c("Low", "High", "Medium", "Low", "High")
)
df_env_data_na

# filter
df_env_data_clean <- df_env_data_na %>% 
  filter(!is.na(ecosystem))

# ------------------------------------------------------
#  select
# ------------------------------------------------------

pollution_data <- df_env_data %>% 
  select(ecosystem, pollution_level)


colnames(df_env_data)

# ------------------------------------------------------
#  long data set
# ------------------------------------------------------

df_env_data_long <- data.frame(
  ecosystem = c("Forest", "Desert", "Wetland", "Grassland", "Urban",
                "Forest", "Desert", "Wetland", "Urban", "Urban"),
  species_richness = c(120, 45, 80, 60, 30,
                       110, 50, 85, 65, 35),
  pollution_level = c("Low", "High", "Medium", "Low", "High",
                      "Low", "High", "Medium", "Low", "High")
)

df_env_grouped <- df_env_data_long %>% 
  group_by(ecosystem) %>% 
  mutate(mean_species_richness = mean(species_richness))


# summary 
summary_table <- df_env_data_long %>% 
  group_by(ecosystem) %>% 
  summarise(mean_species_richness = mean(species_richness),
            total_species = sum(species_richness),
            count = n())
summary_table

# ------------------------------------------------------
# joins
# ------------------------------------------------------
df_env_data

# create second dataset
df_pollution <- data.frame(
  pollution_level = c("Low", "High", "Medium"),
  water_quality = c("drink and swim", "not swim", "swim only"),
  super_fund_site = c(FALSE, TRUE, FALSE)
)

df_join <- left_join(x = df_env_data, y = df_pollution, by = "pollution_level")








