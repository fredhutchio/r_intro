#### Intro to R: class 2 exercises ####

# Working with dataframes

# Objectives:
#   importing data into R
#   working with data frames
#   subsetting data frames
#   manipulating factors

#### In-class exercises ####

## Challenge: download, inspect, and import the following data files (smaller set of data from same clinical set)
# example1: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.tsv
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.tsv", "data/clinical.tsv")
clinical_tsv <- read.delim("data/clinical.tsv")
# example2: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt", "data/clinical.txt")
clinical_txt <- read.table("data/clinical.txt", header=TRUE)
# can also read into R straight from URL using read.csv, but better practice to download data file for reference

## Challenge: What is the class, how many rows/columns, how many types of cancer (disease)?
class(clinical) # class is dataframe
nrow(clinical) # 6832 rows
ncol(clinical) # 20 columns
dim(clinical) # 6832 rows, 20 columns
str(clinical) # overview with all info, including 15 types of cancer ("Factor w/ 15 levels)

## Challenge: what is the difference in results between these two lines of code?
# extract first column, assigning each result to object to show that data structure differs between output
test <- clinical[ , 1]
test2 <- clinical[1]
class(test) # factor (technically, a vector of factors)
class(test2) # data.frame

## Challenge: code as many different ways possible to extract the column days_to_death
clinical$days_to_death
clinical[6]
clinical[,6]
clinical[[6]]
clinical["days_to_death"] 
clinical[ , "days_to_death"] 
clinical[["days_to_death"]]

## Challenge: extract the first 6 rows for only age at diagnosis and days to death
clinical[1:6, c(3, 6)]

## Challenge: calculate the range and mean for cigarettes per day
range(clinical$cigarettes_per_day, na.rm = TRUE)
mean(clinical$cigarettes_per_day, na.rm = TRUE)

## Challenge: replace "not reported" in ethnicity with NA
ethnicity <- clinical$ethnicity
levels(ethnicity) # show levels of factor
# rename factors
levels(ethnicity)[3] <- NA
# replace race in data frame
clinical$ethnicity <- ethnicity
# check to see it worked
levels(ethnicity)
# do a Google search to find additional strategies for renaming missing data
# for search "replace missing data R", the following result provides a lot of options: 
# https://stackoverflow.com/questions/8161836/how-do-i-replace-na-values-with-zeros-in-an-r-dataframe

#### Extra exercises ####

## Using the same clinical object from class 2, write code to accomplish the following tasks:

# extract the last 100 rows for only disease and race and save to an object called disease_race
# show index positions of column names
names(clinical)
# extract desired object
disease_race <- clinical[6733:6832, c(20, 16)]

# calculate the minimum and maximum for days to death
min(clinical$days_to_death, na.rm = TRUE)
max(clinical$days_to_death, na.rm = TRUE)
range(clinical$days_to_death, na.rm = TRUE) # does both together
summary(clinical$days_to_death) # all summary stats for this answer

# change all of the factors of race to shorter names for each category, and appropriately indicate missing data
# save column to object
race <- clinical$race 
# recall levels of object
levels(race) 
# rename factors
levels(race)[1] <- "American Indian"
levels(race)[2] <- "Asian"
levels(race)[3] <- "black"
levels(race)[4] <- "Pacific Islander"
levels(race)[5] <- NA
# recall levels of object
levels(race) 
# replace race in data frame
clinical$race <- race
