#### Intro to R: data parsing with dplyr ####

#### Objectives ####

# review previous weeks' material

# Today:
# installing and loading packages
# selecting columns and rows
# combining commands using pipes
# creating new columns by modifying existing data
# summarizing data based on data in other columns

#### Packages and tidyverse ####

# packages are collections of functions that anyone can write and share for public use
# today, using dplyr for large scale data; part of tidyverse
# tidyverse is a collection of packages that are trendy/useful for large-scale data manipulation
# can install parts of tidyverse independently, but might as well install all at once (we'll use next week, too)
# install package (only once on your own computer)
install.packages("tidyverse") 
# explain output in console; red doesn't necessarily mean anything is wrong!
# load library/package (needs to happen every time R restarts)
library(tidyverse)
# attaching packages references everything included in tidyverse
# there are many other packages included as dependencies
# conflicts represents functions with same names that are present in base R (stats)
# double colon syntax (::) allows you to reference functions with same name but present in other packages
# check dplyr installation
?select
# help documentation should open up for select {dplyr}, indicating package has loaded appropriately
# some folks may end up with errors later if required packages didn't install perfectly; tell instructor if you get an error saying a function isn't available

#### Selecting columns and rows ####

# reading in data and saving to object
clinical <- read.csv("data/clinical.csv")
# recall object
clinical
str(clinical)

# selecting columns with dplyr
sel_columns <- select(clinical, tumor_stage, ethnicity, disease)
# select rows conditionally
filtered_rows <- filter(clinical, disease == "LUSC") # keep only breast cancer cases
filtered_smoke <- filter(clinical, !is.na(years_smoked)) # remove missing data from years smoked

## Challenge: create a new object from "clinical" called "race_disease" that includes only the race, ethnicity, and disease

## Challenge: create a new object from "race_disease" called "race_BRCA" that includes only BRCA

#### Combining commands ####

# use intermediate files to combine commands (answer from previous challenge)
race_disease <- select(clinical, race, ethnicity, disease)
clinical_brca <- filter(race_disease, disease == "BRCA")

# nest commands (same object as created above, but here only in two lines)
clinical_brca <- select(filter(clinical, disease == "BRCA"), race, ethnicity, disease)

# combine commands using pipes (easier to keep track of more complex data manipulations)
# same example as above
piped <- clinical %>%
  select(race, ethnicity, disease) %>%
  filter(disease == "BRCA")
# extract race, ethinicity, and disease from cases born prior to 1930 
piped2 <- clinical %>%
  filter(year_of_birth < 1930) %>%
  select(race, ethnicity, disease)
# does the order of commands differ?
piped3 <- clinical %>%
  select(race, ethnicity, disease) %>%
  filter(year_of_birth < 1930)

## Challenge: using pipes, extract the columns gender, years_smoked, and year_of_birth from the object clinical for only living patients (column "vital_status") who have smoked fewer than 1 cigarettes per day

#### Mutate ####

# mutate allows unit conversions or ratios
# convert days to years
clinical_years <- clinical %>%
  mutate(years_to_death = days_to_death / 365)
# convert days to year and months at same time and send to head for easier viewing
clinical %>%
  mutate(years_to_death = days_to_death / 365,
         months_to_death = days_to_death / 30) %>%
  head()
# filter out missing data with pipes
clinical %>%
  filter(!is.na(days_to_death)) %>%
  mutate(years_to_death = days_to_death / 365,
         months_to_death = days_to_death / 30) %>%
  head()

## Challenge: create a new object from clinical including only lung cancer patients (LUSC from disease column) that includes a new column called total_cig representing an estimate of the total number of cigarettes smoked during the individual's lifetime

#### Split-apply-combine ####

# split data into groups, apply an analysis to each group, combine results back into one object

# group_by not always useful by itself, but powerful together with tally()
# count number of individuals with each tumor stage
clinical %>%
  group_by(tumor_stage) %>%
  tally() # empty parentheses not required, but good practice

# group_by often followed by summarize
# summarize average days to death by gender
clinical %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death, na.rm = TRUE))
# why doesn't the above work to remove NA?

# remove NA
clinical %>%
  filter(!is.na(days_to_death)) %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death))

#### Create datasets for visualization next week ####

# Challenge: remove missing data for smoking, age at diagnosis
smoke_complete <- clinical %>% 
  filter(!is.na(age_at_diagnosis)) %>% 
  filter(!is.na(cigarettes_per_day))

# saving results to file
write.csv(smoke_complete, "data/smoke_complete.csv", row.names = FALSE)

## Challenge: create a new object called "birth_complete" that contains no missing data for year of birth or vital status 

# make sure ALL mising data is removed!
birth_complete <- clinical %>% 
  filter(!is.na(year_of_birth)) %>% 
  filter(!is.na(vital_status)) %>%
  filter(vital_status != "not reported")

# check to see numbers of each cancer type
table(birth_complete$disease)

# remove cancers with fewer than 500 cases
# counting number of records in each cancer
cancer_counts <- clinical %>%
  count(disease) 

# get names of frequently occcuring species
frequent_cancers <- cancer_counts %>%
  filter(n >= 500) %>%
  select(disease)
# extract data from cancers to keep
birth_reduced <- birth_complete %>%
  filter(disease %in% frequent_cancers$disease)

# Challenge: save results to file
write.csv(birth_reduced, "data/birth_reduced.csv", row.names = FALSE)

#### Wrapping up ####

# review objectives
# preview next week's objectives
