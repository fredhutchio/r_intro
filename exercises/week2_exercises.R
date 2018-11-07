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
# example2: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt

## Challenge: What is the class, how many rows/columns, how many types of cancer (disease)?

## Challenge: what is the difference in results between these two lines of code?
clinical[ , 1]
clinical[1]

## Challenge: code as many different ways possible to extract the column days_to_death

## Challenge: extract the first 6 rows for only age at diagnosis and days to death

## Challenge: calculate the range and mean for cigarettes per day

## Challenge: replace "not reported" in ethnicity and race with NA
# do a Google search to find additional strategies for renaming missing data

#### Extra exercises ####

## Using the same clinical object from week 2, write code to accomplish the following tasks:

# extract the last 100 rows for only disease and race and save to an object called disease_race

# calculate the minimum and maximum for days to death

# change all of the factors of race to shorter names for each category, and appropriately indicate missing data
