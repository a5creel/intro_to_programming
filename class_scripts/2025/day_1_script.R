a <- 2
b <- 3 

a+b

# this is a comment 

# ---------------------
# data types 
# ---------------------

# numeric: integer  
myInt <- 1 

myInt

# numeric: double 
myNum <- 2.4

# character (string)
myChar_a <- "a"
myChar_b <- 'b'

trick_q <- "1"

# myNum + trick_q

myNum + myInt

# logical (boolean, indicator): true/false
my_true <- TRUE
my_False <- FALSE

myLogic_1 <- (3<4)
myLogic_2 <- (3>4)

myEx <- (myInt<myNum)

# ---------------------
# storing datatypes 
# ---------------------

# numeric vector
myVec_n <- c(1,2,3,4,5)

# character/string vector
myVec_s <- c(myChar_a, "b", "c")

# character/string vector
myVec_string <- c(1, "b", "c")


#matrix
myMat_n <- matrix(c(myVec_n, 6,7,8,9,10),
                  nrow = 2,
                  ncol = 5)

# list 
myList <- list(2, "c", myMat_n)
myList[[1]]
myList[[3]]

# -------------------
# data frames
# -------------------

myDF <- as.data.frame(myMat_n)

colnames(myDF)

colnames(myDF) <- c("num_hunts", "temp", "num_adults", "num_cubs", "distance_from_road")

# investigate a column
myDF$num_hunts

# create a new column 
myDF$total_lions <- myDF$num_adults + myDF$num_cubs


# -------------------
# create data frame from scratch
# -------------------

myPpl <- data.frame(
  name = c("Andie", "Bridger", "Scott"),
  gender = c("Female", "non-binary", "Male"),
  male = c(F, F, T), 
  income_cat = c("middle", "poor", "rich"),
  park_dist_mi = c(1, 0.5, 0.1)
)

# referencing with $: version 1
myPpl$name

# bracket notation: [row, column]
myPpl[,1]

myPpl[1,]

myPpl[2,]

# referencing a cell 
#version 1: $ notation 
myPpl$name[2]

# version 2: [row, column]
myPpl[2, 1]

# ----------------
# word of caution
# ----------------

a <- 5
a <- a + 1

a <- 5
a_new <- a + 1

# ----------------
# functions
# ----------------

get_visits <- function(Far){
  v <- Far/100 - (Far/100)^2
  return(v)
}

get_visits(0)
get_visits(25)
get_visits(50)
get_visits(75)
get_visits(100)


# ----------------
# Loops: iterates through task multiple times 
# ----------------

print(1)
print(2)
print(3)
print(4)

# first loop 
for(i in 1:4){
  print(i)
}

# first loop 
for(i in 1:4){
  y <- i/4
  print(y)
}

# let combine the loop with our get_visits function 
for(i in 0:4){
  y <- get_visits(i*25)
  print(y)
}

max_temps <- seq(0,100, by = 1)

for(i in max_temps){
  y <- get_visits(i)
  print(y)
}

myPpl

# moving example without a loop 
myPpl$new_park_dist_a[1] <- myPpl$park_dist_mi[1] + 1
myPpl$new_park_dist_a[2] <- myPpl$park_dist_mi[2] + 1
myPpl$new_park_dist_a[3] <- myPpl$park_dist_mi[3] + 1
myPpl

# moving ex with a loop 
for (i in 1:3) {
  myPpl$new_park_dist_b[i] <- myPpl$park_dist_mi[i] + 1
}

# ------------
# fixing RA's error
# ------------

for (i in 1:3) {
  if(myPpl$male[i]==FALSE){
    myPpl$park_dist_correct[i] <- myPpl$park_dist_mi[i] - 0.25
  }else{
    myPpl$park_dist_correct[i] <- myPpl$park_dist_mi[i]
  }
}
myPpl











