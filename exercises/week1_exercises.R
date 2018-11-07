#### Intro to R: week 1 exercises ####

# Introduction to R and RStudio

# Objectives:
#   RStudio and R syntax
#   using functions
#   assigning objects
#   working with vectors
#   dealing with missing data

#### In-class exercises ####

## Challenge: what does the function ceiling do? What are its main arguments? How did you determine this?

## Challenge: what is the value of each item at each step?
mass <- 47.5            # mass?
width  <- 122             # width?
mass <- mass * 2.0      # mass?
width  <- width - 20        # width?
mass_index <- mass/width  # mass_index?

## Challenge:
# How many things are in organs?
# what type of data is organs?
# get overview of organs

## Challenge: what happens when each of the objects are created?
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

## Challenge: why does the following code return TRUE: "four" > "five"

## Challenge:
# create vector
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
# remove NAs from heights
# calculate median of heights
# identify number of people who are taller than 67 inches
# visualize data as a histogram (hint: function hist)

#### Extra exercises ####
