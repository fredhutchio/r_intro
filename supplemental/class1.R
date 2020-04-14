# basic math
4 + 5 

# same code as above, without spaces
4+5

# using a function: rounding numbers
round(3.14)

# using a function with more arguments
round(3.14, digits = 1)

# can switch order of arguments
round(digits = 1, x = 3.14)

# assigning value to an object
weight_kg <- 55

# recall object
weight_kg

# multiple an object (convert kg to lb)
2.2 * weight_kg

# assign weight conversion to object
weight_lb <- 2.2 * weight_kg

# reassign new value to an object
weight_kg <- 100

# remove object
remove(weight_lb) 

mass <- 47.5            # mass?
width  <- 122             # width?
mass <- mass * 2.0      # mass?
width  <- width - 20        # width?
mass_index <- mass/width  # mass_index?

# assign vector
ages <- c(50, 55, 60, 65) 
# recall vector
ages

# how many things are in object?
length(ages)
# what type of object?
class(ages)
# get overview of object
str(ages)

# performing functions with vectors
mean(ages)
range(ages)

# vector of body parts
organs <- c("lung", "prostate", "breast")

num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

# add a value to end of vector
ages <- c(ages, 90) 

# add value at the beginning
ages <- c(30, ages)

# extracting second value
organs[2] 

# excluding second value
organs[-2] 

# extracting first and third values
organs[c(1, 3)] 

ages > 60 

# extracts values which meet condition
ages[ages > 60] 

# extracts values numerically equivalent values
ages[ages == 60]

# ages less than 50 OR greater than 60
ages[ages < 50 | ages > 60]

# ages greater than 50 OR less than 60
ages[ages > 50 & ages < 60]

"four" > "five"

# create a vector with missing data
heights <- c(2, 4, 4, NA, 6)

# calculate mean and max on vector with missing data
mean(heights)
max(heights)

# add argument to remove NA
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

# identify elements which are missing data
is.na(heights)

# reverse the TRUE/FALSE
!is.na(heights)

# extract elements which are not missing values
heights[!is.na(heights)]

# remove incomplete cases
na.omit(heights) 

# create vector
more_heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
