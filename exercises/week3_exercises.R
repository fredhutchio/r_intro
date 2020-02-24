#### Intro to R: week 3 exercises ####

# Data parsing with dplyr

# Objectives:
#   installing and loading packages
#   selecting columns and rows
#   combining commands using pipes
#   creating new columns by modifying existing data
#   summarizing data based on data in other columns

# Solutions available here: https://github.com/fredhutchio/R_intro/blob/master/solutions/week3_solutions.R

#### In-class exercises ####

## Challenge: create a new object from clinical called race_disease that includes only the race, ethnicity, and disease columns

## Challenge: create a new object from race_disease called race_BRCA that includes only BRCA (disease)

## Challenge: Use pipes to extract the columns gender, years_smoked, and year_of_birth from the object clinical for only living patients (vital_status) who have smoked fewer than 1 cigarettes per day

## Challenge: extract only lung cancer patients (LUSC, from disease) and create a new column called total_cig representing an estimate of the total number of cigarettes smoked (use columns years smoked and cigarettes per day)

## Challenge: create object called smoke_complete from clinical that contains no missing data for cigarettes per day or age at diagnosis 
# Extra: how do you save resulting table to file?

## Challenge: create a new object called birth_complete that contains no missing data for year of birth or vital status

## Challenge: extract all tumor stages for which there are more than 200 cases (also check to see if there are any other missing/ambiguous data!)


#### Extra exercises ####

# How many hispanic or latino individuals in clinical are not also white? What are their races?

# Create a new column for clinical called age_at_death that calculates this statistic (in years) from year_of_birth and year_of_death 
