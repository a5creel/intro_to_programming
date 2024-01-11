#tidyr
#dplyr
#ggplot2

# Andie Creel / Date Started: january 11, 2024
# Goal: learn data manipulation 

library(tidyr)
library(dplyr)
library(ggplot2)

# make a dataframe 

myBase <- data.frame(
  gender = c("male", "non-binary", "female"),
  male = c(T, F, F),
  height = c(152, 171.5, 165),
  weight = c(81, 93, 26),
  age = c(42, 38, 26)
)

myDplyr <- myBase

# manipulate a column 

# base R
for (i in 1:3) {
  myBase$age[i] <- myBase$age[i] + 1
}

myBase$age[1] <- myBase$age[1] + 1
myBase$age[2] <- myBase$age[2] + 1
myBase$age[3] <- myBase$age[3] + 1

# dplyr

myDplyr <- myDplyr %>%
  mutate(age = age + 1) 

# creating a new variable
for (i in 1:length(myBase$age)) {
  myBase$age_new[i] <- myBase$age[i] + 1
}

# dplyr
myDplyr <- myDplyr %>%
  mutate(age_new = age + 1)


# change the age if someone is male 
# base r 
for (i in 1:length(myBase$male)) {
  if(myBase$male[i] == TRUE){
    myBase$age_new_m[i] <- myBase$age[i] - 3
  }else{
    myBase$age_new_m[i] <- myBase$age[i]
  }
}

# dplyr
myDplyr <- myDplyr %>%
  mutate(age_new_m = if_else(male == TRUE, age - 3, age)) %>%
  mutate(age_new_f = if_else(male == FALSE, age+4 , age))

myDplyr <- myDplyr %>%
  mutate(age_new_m = if_else(male == TRUE | height < 170 , age - 3, age))


# dataset of employees

myEmps <- data.frame(
  id = 1:5,
  name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  department = c("IT", "Market", "HR", "Market", "IT"),
  salary = c(45000, 55000, 40000, 60000, 50000)
)


# filtering: rows operations 
myEmps_m <- myEmps %>%
  filter(department == "Market")


# selecter: works on columns
myEmps_thin <- myEmps %>%
  # select(id, department, salary)
  select(-name)


# group by 
myEmps_grouped <- myEmps %>%
  group_by(department) %>%
  mutate(dept_total_salary = sum(salary)) 


# summarise 
mySummary <- myEmps %>%
  group_by(department) %>%
  summarise(mean_sal = mean(salary), 
            num_employess = n(), 
            total_sal = sum(salary))



# second datasets
myDepts <- data.frame(
  department = c("IT", "Market", "HR"), 
  location = c("Building A", "Building B", "Building C"), 
  boss = c("John", "Jane", "Mike")
)


myJoin <- left_join(x = myEmps, y = myDepts, by = "department") 









