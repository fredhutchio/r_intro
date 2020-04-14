## # install package
## install.packages("tidyverse")

# load library/package
library(tidyverse)

# import data
clinical <- read_csv("data/clinical.csv")

# inspect object
str(clinical)

# selecting columns with tidyverse (dplyr)
sel_columns <- select(clinical, tumor_stage, ethnicity, disease)

# select range of columns
sel_columns2 <- select(clinical, tumor_stage:vital_status)

# select rows conditionally: keep only lung cancer cases
filtered_rows <- filter(clinical, disease == "LUSC") 

# same task as challenges, but nested commands 
race_BRCA2 <- select(filter(clinical, disease == "BRCA"), race, ethnicity, disease)

# same task as above, but with pipes
piped <- clinical %>%
  select(race, ethnicity, disease) %>%
  filter(disease == "BRCA")

# extract race, ethinicity, and disease from cases born prior to 1930
piped2 <- clinical %>%
  filter(year_of_birth < 1930) %>%
  select(race, ethnicity, disease)

## piped3 <- clinical %>%
##   select(race, ethnicity, disease) %>%
##   filter(year_of_birth < 1930)

# convert days to years
clinical_years <- clinical %>%
  mutate(years_to_death = days_to_death / 365)

# convert days to year and months at same time, and we don't always need to assign to object
clinical %>%
  mutate(years_to_death = days_to_death / 365,
         months_to_death = days_to_death / 30) %>%
  glimpse() # preview data output

# show categories in gender
unique(clinical$gender)

# count number of individuals of each gender
clinical %>%
  group_by(gender) %>%
  tally() 

# summarize average days to death by gender
clinical %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death, na.rm = TRUE))

# remove NA
clinical %>%
  filter(!is.na(gender)) %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death))

smoke_complete <- clinical %>%
  filter(!is.na(age_at_diagnosis)) %>%
  filter(!is.na(cigarettes_per_day))
write_csv(smoke_complete, "data/smoke_complete.csv")

# make sure ALL missing data is removed!
birth_complete <- clinical %>%
  filter(!is.na(year_of_birth)) %>%
  filter(!is.na(vital_status)) %>%
  filter(vital_status != "not reported")

# counting number of records in each cancer
cancer_counts <- clinical %>%
  count(disease) %>%
  arrange(n) 

# get names of frequently occurring cancers
frequent_cancers <- cancer_counts %>%
  filter(n >= 500) 

# extract data from cancers to keep
birth_reduced <- birth_complete %>%
  filter(disease %in% frequent_cancers$disease)

# save results to file in data/ named birth_reduced
write_csv(birth_reduced, "data/birth_reduced.csv")
