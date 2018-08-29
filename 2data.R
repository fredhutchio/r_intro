#### Intro to R: working with dataframes ####

#### Before class ####

# share url to hackmd
# share Dropbox script to this week's content

#### Objectives ####

# review previous week's material

# Today:
# importing data into R
# working with data frames
# subsetting data frames
# manipulating factors

#### Reading in data ####

# project organization
# remind that folders and directories are synonymous
# tie into the strength of RStudio projects
# directories for: data, figures, intermediate or results
# describe use of buttons to make new directories

# making a directory
dir.create("data")

# overview of tidy data principles
# appropriate composition of data into tables still isn't commonly taught!
# columns: variables
# rows: observations
# one piece of info per cell
# csv: comma separated values (other things besides commas can have separators too though)

# download data from url
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.csv", "data/clinical.csv")
# describe how to tell if you can use a URL to download data files
# can't download using Dropbox URLs

# reading in data and saving to object
clinical <- read.csv("data/clinical.csv")
# recall object
clinical
# view in tab
View(clinical)
# describe where data came from and give brief overview of metadata: TCGA clinical data from different cancer types
# show script used to produce data
# note data in tab can't be edited!
# note missing data

# reading in data files formatted differently
?read.csv
# read.csv is one of a family of commands to import data
# explore other options for importing data

## Challenge: download, inspect, and import the following data files (smaller set of data from same clinical set)
# example1: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.tsv
# read.delim
# example2: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt
# read.table(header=TRUE)
# can also read into R straight from URL using read.csv, but better practice to download data file for reference

#### Data frames ####

# data frames: tabular/spreadsheet data
# table where columns are vectors all of same length
# columns contain single type of data (characters, integers, factors)

# inspect data frames
# assess size of data frame
dim(clinical)
nrow(clinical)
ncol(clinical)
# preview content
head(clinical) # show first few rows
tail(clinical) # show last few rows
# view names
names(clinical) # column names
rownames(clinical) # row names (only numbers here)
# summarize
str(clinical) # structure of object
summary(clinical) # summary statistics by column

## Challenge: What is the class, how many rows/columns, how many types of cancer (disease)?

#### Subsetting data frames ####

# rows, columns
# extract first column
clinical[ , 1]
clinical[1]

## Challenge: what is the difference in results between the last two lines of code?

# extract first row, first column
clinical[1,1]
# extract single row 
clinical[1, ]
# extract a range of cells
clinical[1:3, 2] # rows 1 to 3, second column
# exclude certain data subsets
clinical[ , -1] # exclude first column
clinical[-c(1:100), ] # exclude first 100 rows
# save extracted data to new object
test_clinical <- clinical[1:20, ]

# extract columns by name
clinical["tumor_stage"] # result is data.frame
clinical[ , "tumor_stage"] # results in vector
clinical[["tumor_stage"]] # results in vector
clinical$tumor_stage # results in vector
# reference exploring different types of subsetting: https://davetang.org/muse/2013/08/16/double-square-brackets-in-r/

## Challenge: code as many different ways possible to extract the column days_to_death

## Challenge: extract the first 6 rows for only age at diagnosis and days to death

## Challenge: calculcate the range and mean for cigarettes per day

#### Factors ####

# factors represent categorical data
# predefined sets of values (levels), in alphabetical order
# stored as integers with labels
# can be ordered or unordered

# create factor
sex <- factor(c("male", "female", "female", "male"))
levels(sex) # show levels
nlevels(sex) # count levels
# show current
sex
# reorder (may be necessary if order matters)
sex <- factor(sex, levels = c("male", "female"))
# show reordered
sex

# converting factors
as.character(sex)

# renaming factors
plot(clinical$race) # plot data (may need to resize the window)
race <- clinical$race # save data to object
levels(race) # show levels of factor
# rename factors
levels(race)[1] <- "American Indian"
levels(race)[2] <- "Asian"
levels(race)[3] <- "black"
race # show revised data
# replace race in data frame
clinical$race <- race
# replot with corrected names
plot(clinical$race)

## Challenge: replace "not reported" in ethnicity and race with NA
# do a Google search to find additional strategies for renaming missing data

#### Extra: creating a simple data frame without importing data ####

# create individual vectors
cancer <- c("lung", "prostate", "breast")
metastasis <- c("yes", "no", "yes")
cases <- c(30, 50, 100)
# combine vectors
example_df1 <- data.frame(cancer, metastasis, cases)
str(example_df1)

# create vectors and combine at once
example_df2 <- data.frame(cancer = c("lung", "prostate", "breast"),
                          metastasis = c("yes", "no", "yes"),
                          cases = c(30, 50, 100), stringsAsFactors = FALSE) # determines whether character or factor
str(example_df2)

#### Wrapping up ####

# review objectives
# preview next week's objectives
