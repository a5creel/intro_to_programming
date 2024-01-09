# This is a python script. 
import pandas as pd 



a = 3
b = 5
a+b

2+3

# Numeric -- integer: no decimal points
myInt = 1

# Numeric -- floating point: decimal points
myNum = 2.4

# logical (Boolean): a true/false statement. Use parentheses to evaluate if something is true or false
myBool_1 = (3 < 4)
myBool_2 = (3 > 4)

# character (string)
myChar_a = "a"
myChar_b = 'b'

# Create a DataFrame
myPpl = pd.DataFrame({
    'gender': ["Male", "non-binary", "Female"],
    'male': [True, False, False],
    'height': [152, 171.5, 165],
    'weight': [81, 93, 78],
    'age': [42, 38, 26]
})

# Reference one column (either of these work)
myPpl['male']
myPpl.male

