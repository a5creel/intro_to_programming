# Andie Creel / January 12, 2023
# Learn Python 

2 + 3 

a = 2
b = 3

print(a+b)

# logical
myBool = (3<4)
myBool_2 = (3>4)


myBool_3 = True

# characters/strings 

myChar = "hello world"
myChar_2 = 'hello class'


import numpy as np

myList_n = [1,2,3,4,5]
print(myList_n[0])

# matrix
myMat = np.array([1,2,3,4,5,6,7,8,9,10]).reshape(2,5)
myMat


import pandas as pd

myDF = pd.DataFrame(myMat)
myDF

print(myDF.columns)

myDF.columns = ["age", "weight", "income", "height_ft", "height_in" ]


myDF['age']

myDF


# create a dataframe

myPpl = pd.DataFrame({
  'gender': ["Male", "non-binary", "Female"],
  'male': [True, False, False], 
  'height': [152, 171.1, 165],
  'weight': [81, 93, 78], 
  'age': [42, 38, 26]
})

myPpl["age"]
myPpl.age


# function 
def myF(x):
  y = x-x**2
  return y 


myF(.25)


myPpl

# loops
for i in range(1,5): # range start the stop, start in inclusive, and stop is excluded 
  print(i)


# loops and functions
for i in range(1, 5): 
  y = myF(x = i/4)
  print(y)


# initialize 

myPpl["age_new"] = myPpl["age"]


# loops
for i in range(len(myPpl)):
  if myPpl.loc[i, "male"]:
    myPpl.loc[i, "age_new"] = myPpl.loc[i, "age"] - 3
  
myPpl



