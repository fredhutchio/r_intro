#### Intro to R: week 2 exercises ####

# Working with dataframes

# Objectives:
#   importing data into R
#   working with data frames
#   subsetting data frames
#   manipulating factors

#### In-class exercises ####

## Challenge: download, inspect, and import the following data files (smaller set of data from same clinical set)
# example1: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.tsv
read.delim
# example2: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt
# read.table(header=TRUE)
# can also read into R straight from URL using read.csv, but better practice to download data file for reference

## Challenge: What is the class, how many rows/columns, how many types of cancer (disease)?

## Challenge: what is the difference in results between the last two lines of code?

## Challenge: code as many different ways possible to extract the column days_to_death

## Challenge: extract the first 6 rows for only age at diagnosis and days to death

## Challenge: calculate the range and mean for cigarettes per day

## Challenge: replace "not reported" in ethnicity and race with NA
# do a Google search to find additional strategies for renaming missing data

#### Extra exercises ####

# Using the same dataset as described in class, write code to accomplish the following tasks

# extract the last 100 rows for only disease and race and save to an object called disease_race

# calculate the range and mean for days to death
