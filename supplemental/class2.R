## # make a directory
## dir.create("data")



# download data from url
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.csv", "data/clinical.csv")

# import data and assign to object
clinical <- read.csv("data/clinical.csv")

# assess size of data frame
dim(clinical)

# preview first few rows
head(clinical) 

# show last three rows
tail(clinical, n = 3) 

# view column names
names(clinical) 

# show overview of object
str(clinical) 

# provide summary statistics for each column
summary(clinical) 

# extract first column and assign to a variable
first_column <- clinical[1]

# extract first column
first_column_again <- clinical[ , 1]

# extract first row 
first_row <- clinical[1, ]

# extract cell from first row of first column
single_cell <- clinical[1,1]

# extract a range of cells, rows 1 to 3, second column
range_cells <- clinical[1:3, 2]

# exclude first column
exclude_col <- clinical[ , -1] 

# exclude first 100 rows
exclude_range <- clinical[-c(1:100), ] 

# extract column by name
name_col1 <- clinical["tumor_stage"]
name_col2 <- clinical[ , "tumor_stage"]

# double square brackets syntax
name_col3 <- clinical[["tumor_stage"]]

# dollar sign syntax
name_col4 <- clinical$tumor_stage

# create vector with factor data
test_data <- factor(c("placebo", "test_drug", "placebo", "known_drug"))
# show factor
test_data

# show levels of factor
levels(test_data) 

# reorder factors to put placebo at end
test_data <- factor(test_data, levels = c("known_drug", "test_drug", "placebo"))
# show reordered
test_data

# converting factors to numeric
as.numeric(test_data)

# quick and dirty plot
plot(clinical$race) 

# assign race data to new object 
race <- clinical$race 
levels(race)

levels(race)[1]

# correct factor levels
levels(race)[1] <- "Am Indian"
levels(race)[2] <- "Asian" # capitalize asian
levels(race)[3] <- "black"
levels(race)[4] <- "Pac Isl"
levels(race)[5] <- "unknown"
# show revised levels
levels(race) 

# replace race in data frame
clinical$race <- race
# replot with corrected names
plot(clinical$race)

# create individual vectors
cancer <- c("lung", "prostate", "breast")
metastasis <- c("yes", "no", "yes")
cases <- c(30, 50, 100)
# combine vectors
example_df1 <- data.frame(cancer, metastasis, cases)
str(example_df1)

# create vectors and combine into data frame simultaneously
example_df2 <- data.frame(cancer = c("lung", "prostate", "breast"),
                          metastasis = c("yes", "no", "yes"),
                          cases = c(30, 50, 100), stringsAsFactors = FALSE)
str(example_df2)
