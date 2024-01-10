# Andie Cree / January, 2024 
# Goal: base R material 

# Numeric -- integers (no decimal points)
myInt <- 1

# Number -- double (decimal points)
myNum <- 2.4

# Logical(booleans) -- true false variables 
myBool <- (3<4)
myBool_2 <- (3>4)

# Character or strings 
myChar <- "a"
myChar_1 <- "3"

2+3

george <- "george is in class"

# ways to store data

# vector 
myVec_n <- c(1,2,3, 4, 5)
myVec_n

# string vector
myVec_s <- c(myChar_1, myChar, "b", "c")
myVec_s

# remove 
rm(myNum)

# matrices 
myMat_n <- matrix(c(myVec_n, 
                    6,7,8,9,10), 
                  nrow = 5,  
                  ncol = 2)
myMat_n

# lists 
myList <- list(2, "c", myMat_n)
myList

# data frames 
myDF <- as.data.frame(myMat_n)
colnames(myDF)

colnames(myDF) <- c("Age", "Height")

myDF$Age

# new column 
myDF$nonsense <- myDF$Age + myDF$Height
myDF$nonsense 

myDF

myDF$Age

# New Data frame 

myPpl <- data.frame(
  gender = c("Male", "non-binary", "Female"), 
  male = c(TRUE, FALSE, FALSE), 
  height = c(152, 171.1, 165), 
  weight = c(81, 93, 78),
  age = c(42, 38, 26)
)

# referencing one column 
myPpl$height

# column number for reference 
myPpl[,3]

# reference on row 
myPpl[1,]

# refence a cell 
myPpl[1,1]

# reference a cell 
myPpl$gender[1]

# functions 
myF <- function(x){
  y <- x - x^2
  return(y)
}

myF(.5)
myF(.25)
myF(.7)


# simple for loop
for(i in 1:4){
  print(i)
}

# more for loop 
for(i in 1:4){
  print(i/4)
}

# combining loop and funciton 
for (i in 1:4) {
  y <- myF(i/4)
  print(y)
}

# manipulate data 
for (i in 1:length(myPpl$age)) {
  myPpl$age[i] <- myPpl$age[i] +1
}

# manipulate data 
for (i in 1:length(myPpl$age)) {
  myPpl$age_new[i] <- myPpl$age[i] +1
}

# if else 
for (i in 1:length(myPpl$male)) {
  #if statements
  if(myPpl$male[i] == TRUE){
    myPpl$age_new_m[i] <- myPpl$age[i] - 3
  } else {
    myPpl$age_new_m[i] <- myPpl$age[i]
  }
}





