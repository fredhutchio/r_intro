#### Intro to R: class 3 exercises ####

# Data parsing with dplyr

# Objectives:
#   installing and loading packages
#   selecting columns and rows
#   combining commands using pipes
#   creating new columns by modifying existing data
#   summarizing data based on data in other columns

#### In-class exercises ####

## Challenge: create a new object from clinical called race_disease that includes only the race, ethnicity, and disease columns
race_disease <- select(clinical, race, ethnicity, disease)

## Challenge: create a new object from race_disease called race_BRCA that includes only BRCA (disease)
race_BRCA <- filter(race_disease, disease == "BRCA")

## Challenge: Use pipes to extract the columns gender, years_smoked, and year_of_birth from the object clinical for only living patients (vital_status) who have smoked fewer than 1 cigarettes per day
clinical %>%
  filter(vital_status == "alive") %>%
  filter(cigarettes_per_day < 1) %>%
  select(gender, years_smoked, year_of_birth)

## Challenge: extract only lung cancer patients (LUSC, from disease) and create a new column called total_cig representing an estimate of the total number of cigarettes smoked (use columns years smoked and cigarettes per day)
clinical %>%
  filter(disease == "LUSC") %>%
  mutate(total_cig = years_smoked * cigarettes_per_day)

## Challenge: create object called smoke_complete from clinical that contains no missing data for cigarettes per day or age at diagnosis
smoke_complete <- clinical %>%
  filter(!is.na(age_at_diagnosis)) %>%
  filter(!is.na(cigarettes_per_day))

# Extra: how do you save resulting table to file?
write.csv(smoke_complete, "data/smoke_complete.csv", row.names = FALSE)

## Challenge: create a new object called birth_complete that contains no missing data for year of birth or vital status
birth_complete <- clinical %>%
  filter(!is.na(year_of_birth)) %>%
  filter(!is.na(vital_status)) %>%
  filter(vital_status != "not reported")

## Challenge: extract from clinical all tumor stages for which there are more than 200 cases (also check to see if there are any other missing/ambiguous data!)
# counting number of records for each tumor stage
tumor_counts <- clinical %>%
  count(tumor_stage)
# get names of tumors with many cases
frequent_tumors <- tumor_counts %>%
  filter(n > 200)
# extract data from cancers to keep
tumor_reduced <- clinical %>%
  filter(tumor_stage %in% frequent_tumors$tumor_stage)

#### Extra exercises ####

## How many hispanic or latino individuals in clinical are not also white? What are their races?
clinical %>%
  filter(race != "white") %>% # only non-white individuals
  filter(ethnicity == "hispanic or latino") %>% # only hispanic/latino
  group_by(race) %>% # group by other races
  tally() # count total for each race

## Create a new column for clinical called age_at_death that calculates this statistic (in years) from year_of_birth and year_of_death
clinical <- clinical %>%
  mutate(age = year_of_death - year_of_birth)

## dplyr includes several "helpers" that allows selection of columns meeting particular criteria (described on the first page of the dplyr cheatsheet near the top of the right hand column: https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf). Using one of these tools, extract all columns that include "diagnosis".
# preferred way
clinical %>%
  select(contains("diagnosis"))
# also works, but only because in this example both columns end in "diagnosis"
clinical %>%
  select(ends_with("diagnosis"))

## How many patients are hispanic or latino patients (column ethnicity), died after the year 2000 (year_of_death), and possess no missing data for cigarettes per day?
clinical %>%
  filter(ethnicity == "hispanic or latino") %>%
  filter(year_of_death > 2000) %>%
  filter(!is.na(cigarettes_per_day)) %>%
  count()
  
