#### Intro to R: dataset ####

# install TCGA bioconductor tools
source("https://bioconductor.org/biocLite.R")
#biocLite("TCGAbiolinks")
library(TCGAbiolinks)
library(SummarizedExperiment)
library(tidyverse)

#### Load and save raw data ####

# view data available for lung cancer
TCGAbiolinks:::getProjectSummary("TCGA-LUSC") # lung cancer
TCGAbiolinks:::getProjectSummary("TCGA-BRCA") # breast cancer
TCGAbiolinks:::getProjectSummary("TCGA-PRAD") # prostate cancer
# download and parse clinical data 
LUSC <- GDCquery_clinic(project = "TCGA-LUSC", type = "clinical")
BRCA <- GDCquery_clinic(project = "TCGA-BRCA", type = "clinical")
PRAD <- GDCquery_clinic(project = "TCGA-PRAD", type = "clinical")

# save raw data
write.csv(LUSC, "extra/LUSC.csv", row.names = FALSE)
write.csv(BRCA, "extra/BRCA.csv", row.names = FALSE)
write.csv(PRAD, "extra/PRAD.csv", row.names = FALSE)
# load raw data
LUSC <- read.csv("extra/LUSC.csv")
BRCA <- read.csv("extra/BRCA.csv")
PRAD <- read.csv("extra/PRAD.csv")

#### Clean and save final data ####

# inspecting variables 
str(LUSC)
summary(LUSC)
# remove columns with not useful/confusing data
nope <- c("submitter_id", "updated_datetime", "diagnosis_id", "exposure_id", "demographic_id", "treatment_id")
LUSC <- select(LUSC, -nope)
# remove columns with all missing data
empty <- c("classification_of_tumor", "last_known_disease_status", "days_to_last_known_disease_status", "created_datetime", "days_to_recurrence", "tumor_grade", "progression_or_recurrence", "prior_malignancy", "therapeutic_agents", "treatment_intent_type", "treatment_or_therapy", "weight", "alcohol_history", "alcohol_intensity", "bmi", "height")
LUSC <- select(LUSC, -empty)

# identify columns of interest
good_col <- colnames(LUSC)
# extract columns of interest from other cancers
BRCA <- select(BRCA, good_col)
PRAD <- select(PRAD, good_col)
# bind all together
all_cancer <- rbind(LUSC, BRCA, PRAD)
# save final dataset
write.csv(all_cancer, "data/clinical.csv", row.names = FALSE)
