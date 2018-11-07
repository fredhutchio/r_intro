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
mass <- 47.5            # mass = 47.5
width  <- 122             # width = 122
mass <- mass * 2.0      # mass = 95 (replaces previous mass object)
width  <- width - 20        # width = 102 (replacec previous width object)
mass_index <- mass/width  # mass_index = 0.9313725 (uses second assigned values for each)

## Challenge:
organs <- c("lung", "prostate", "breast")
# How many things are in organs?
length(organs)
# what type of data is organs?
class(organs)
# get overview of organs
str(organs)

## Challenge: what happens when each of the objects are created?
num_char <- c(1, 2, 3, "a") 
class(num_char) # data are character

num_logical <- c(1, 2, 3, TRUE)
class(num_logical) # data are numerical

char_logical <- c("a", "b", "c", TRUE)
class(char_logical) # data are character

tricky <- c(1, 2, 3, "4")
class(tricky) # data are character

## Challenge: why does the following code return TRUE: 
"four" > "five"
# R interprets these as character data, and five comes before four alphabetically, which is used to assess the logic statement

## Challenge:
# create vector
more_heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
# remove NAs from heights
more_heights_clean <- na.omit(more_heights)
# calculate median of heights (multiple answers)
median(more_heights, na.rm = TRUE)
median(more_heights_clean)
# identify how many elements from more_heights are greater than 67 inches
length(more_heights > 67)
# visualize data as a histogram (hint: function hist)
hist(more_heights_clean)

#### Extra exercises ####
