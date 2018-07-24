#### Intro to R: data parsing with dplyr ####


#### Packages and tidyverse ####

# packages are collections of functions that anyone can write and share for public use
# tidyverse is a collection of packages that are trendy/useful for large-scale data manipulation
# install package (only once on your own computer)
install.packages("tidyverse") 
# load library/package (needs to happen every time R restarts)
library(tidyverse)
# check dplyr installation
?select

#### Selecting columns and rows ####

# reading in data and saving to object
clinical <- read.csv("data/clinical.csv")
# recall object
clinical

# selecting columns with dplyr
sel_columns <- select(clinical, tumor_stage, ethnicity, disease)
# select rows conditionally
filtered_rows <- filter(clinical, disease == "BRCA") # keep only breast cancer cases
complete_weight <- filter(clinical, !is.na(years_smoked)) # remove missing data from years smoked

## Challenge: create a new object from "clinical" called "race_disease" that includes only the race, ethnicity, and disease

## Challenge: create a new object from "race_disease" called "race_BRCA" that includes only BRCA

#### Combining commands ####

# use intermediate files to combine commands
clinical2 <- select(clinical, race, ethnicity, disease)
clinical_brca <- filter(clinical2, disease == "BRCA")

# nest commands
clinical_brca <- select(filter(clinical, disease == "BRCA"), race, ethnicity, disease)

# combine commands using pipes
piped <- clinical %>%
  select(race, ethnicity, disease) %>%
  filter(disease == "BRCA")
piped2 <- clinical %>%
  filter(year_of_birth < 1930) %>%
  select(race, ethnicity, disease)

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

# group_by often followed by summarize
clinical %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death, na.rm = TRUE))

# quick and dirty plot
plot(clinical$days_to_death)

# remove missing data
clinical_complete <- clinical %>% 
  filter(species_id != "") %>% #removing empty cells
  filter(!is.na(weight)) %>% #removing NA weights
  filter(!is.na(hindfoot_length))

# remove species with less than 10 counts 
# counting number of records in each species
species_counts <- clinical_complete %>%
  group_by(species_id) %>%
  tally()
# get names of frequently occcuring species
frequent_species <- species_counts %>%
  filter(n >= 10) %>%
  select(species_id)
# extract data from species to keep
clinical_complete <- clinical_complete %>%
  filter(species_id %in% frequent_species$species_id)

# saving results to file
write.csv(clinical_complete, "results/clinical_complete.csv", row.names=FALSE)





