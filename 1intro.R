#### Intro to R: introduction to R syntax and RStudio ####

#### Before class ####

# share URL to hack.md
# check installation of R and RStudio (install former before latter)
# set up project ahead of time and have URL to Dropbox script ready

#### Welcome ####

# instructor introduction
# overview of fredhutch.io
# sign in sheet
# overview course philosophy, how to stay engaged
# course objectives: overview of basic functionality of R (syntax, data manipulation, visualization)

#### Objectives ####

#   RStudio and R syntax
#   using functions
#   assigning objects
#   working with vectors
#   dealing with missing data

#### Orientation to RStudio ####

# ask about previous experience with R and RStudio
# motivation for R and RStudio
# RStudio makes working with R much easier
# create new project in new directory (recommended to place on Desktop or in Documents)
# create new R script, append with .R
# top left window: source (script), where commands are saved
# bottom left window: console, where commands are executed
# top right window: environment, showing what "things" are "remembered" by R
# bottom right window: file browser, plots, packages, help
# many buttons and keyboard shortcuts available for working in RStudio
# workflow: testing commands in source, using keyboard shortcut to send to console
# other keyboard shortcuts available in Help menu
# we have access to RStudio server through http://rstudio.fhcrc.org/

#### Using functions ####

# basic math
4 + 5 # spaces are optional, but easier to read
4+5

# using a function
round(3.14)
# finding help for a command
args(round)
?round
# using a function with more arguments
round(3.14, digits = 1)
# can switch order of arguments (but need to name value!)
round(digits = 1, x = 3.14)

## Challenge: what does the function ceiling do? What are its main arguments? How did you determine this?

# to wrap R source files: Tools -> Global Options -> Code, check box for "Soft-wrap R source files"

#### Assigning objects ####

# assigning value to an object
weight_kg <- 55 # <- is an assignment operator
# recall object
weight_kg
# perform an operation on an object
2.2 * weight_kg
# assign a new value to object
weight_kg <- 57.5
# create new object from operation
weight_lb <- 2.2 * weight_kg
weight_kg <- 100
# the order in which operations are executed matters!
# remove object
rm(weight_kg)
remove(weight_lb)
weight_lb

## Challenge: what is the value of each item at each step?
mass <- 47.5            # mass?
width  <- 122             # width?
mass <- mass * 2.0      # mass?
width  <- width - 20        # width?
mass_index <- mass/width  # mass_index?

#### Vectors ####

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

# vector of characters
organs <- c("lung", "prostate", "breast")

## Challenge:
# How many things are in object?
# what type of object?
# get overview of object

# data types in R
# "character" for strings, uses quotes
# "numeric" (or "double")
# "integer" for integer numbers (e.g., 2L, the L indicates to R that it’s an integer)
# "logical" for TRUE and FALSE (the boolean data type)
# "complex" to represent complex numbers with real and imaginary parts (e.g., 1 + 4i)
# "raw" for bitstreams

## Challenge: what happens when each of the objects are created?
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")

#### Working with vectors ####

# add a value at the end of weights
ages <- c(ages, 90) # c stands for concatenate
# add value at the beginning
ages <- c(30, ages)

# subsetting vectors (index starts at 1)
organs[2] # extracting single value
organs[c(1, 3)] # extracting multiple values
organs[-2] # excluding values

# conditional subsetting
ages > 60 # identifies whether each part of vector meets condition
ages[ages > 60] # extracts values which meet condition
ages[ages == 60]
# can also include <= and >=
# combining conditions: OR
ages[ages < 50 | ages > 60]
# can also combine condition with AND &

## Challenge: why does the following code return TRUE: "four" > "five"

#### Missing data ####

# create new vector with missing data indicated by NA
heights <- c(2, 4, 4, NA, 6)
# perform function on vector
mean(heights) # what is wrong with this answer?
max(heights)
# add argument to remove NA
mean(heights, na.rm = TRUE)
max(heights, na.rm = TRUE)

# additional ways to remove missing data

# identify elements which are missing data
is.na(heights)
# reverse the TRUE/FALSE
!is.na(heights)
# extract elements which are not missing values
heights[!is.na(heights)]

# identify elements that are complete cases
complete.cases(heights)
# extract elements which are complete cases
heights[complete.cases(heights)]

# remove incomplete cases
na.omit(heights) # what is different about this result?

## Challenge:
# create vector
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
# remove NAs from heights
# calculate median of heights
# identify number of people who are taller than 67 inches
# visualize data as a histogram (hint: function hist)

#### Wrapping up ####

# review objectives
# preview next week's objectives
# closing RStudio projects:
#   don't save .RData
#   can change in Global Options
