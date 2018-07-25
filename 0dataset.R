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
# download and parse clinical data 
LUSC <- GDCquery_clinic(project = "TCGA-LUSC", type = "clinical")
BLCA <- GDCquery_clinic(project = "TCGA-BLCA", type = "clinical")
BRCA <- GDCquery_clinic(project = "TCGA-BRCA", type = "clinical")
CESC <- GDCquery_clinic(project = "TCGA-CESC", type = "clinical")
COAD <- GDCquery_clinic(project = "TCGA-COAD", type = "clinical")
GBM <- GDCquery_clinic(project = "TCGA-GBM", type = "clinical")
LGG <- GDCquery_clinic(project = "TCGA-LGG", type = "clinical")
MESO <- GDCquery_clinic(project = "TCGA-MESO", type = "clinical")
PRAD <- GDCquery_clinic(project = "TCGA-PRAD", type = "clinical")
READ <- GDCquery_clinic(project = "TCGA-READ", type = "clinical")
SKCM <- GDCquery_clinic(project = "TCGA-SKCM", type = "clinical")
STAD <- GDCquery_clinic(project = "TCGA-STAD", type = "clinical")
THYM <- GDCquery_clinic(project = "TCGA-THYM", type = "clinical")
UCEC <- GDCquery_clinic(project = "TCGA-UCEC", type = "clinical")
UCS <- GDCquery_clinic(project = "TCGA-UCS", type = "clinical")

# save raw data
write.csv(LUSC, "extra/LUSC.csv", row.names = FALSE)
write.csv(BLCA, "extra/BLCA.csv", row.names = FALSE)
write.csv(BRCA, "extra/BRCA.csv", row.names = FALSE)
write.csv(CESC, "extra/CESC.csv", row.names = FALSE)
write.csv(COAD, "extra/COAD.csv", row.names = FALSE)
write.csv(GBM, "extra/GBM.csv", row.names = FALSE)
write.csv(LGG, "extra/LGG.csv", row.names = FALSE)
write.csv(MESO, "extra/MESO.csv", row.names = FALSE)
write.csv(PRAD, "extra/PRAD.csv", row.names = FALSE)
write.csv(READ, "extra/READ.csv", row.names = FALSE)
write.csv(SKCM, "extra/SKCM.csv", row.names = FALSE)
write.csv(STAD, "extra/STAD.csv", row.names = FALSE)
write.csv(THYM, "extra/THYM.csv", row.names = FALSE)
write.csv(UCEC, "extra/UCEC.csv", row.names = FALSE)
write.csv(UCS, "extra/UCS.csv", row.names = FALSE)
# load raw data
LUSC <- read.csv("extra/LUSC.csv")
BLCA <- read.csv("extra/BLCA.csv")
BRCA <- read.csv("extra/BRCA.csv")
CESC <- read.csv("extra/CESC.csv")
COAD <- read.csv("extra/COAD.csv")
GBM <- read.csv("extra/GBM.csv")
LGG <- read.csv("extra/LGG.csv")
MESO <- read.csv("extra/MESO.csv")
PRAD <- read.csv("extra/PRAD.csv")
READ <- read.csv("extra/READ.csv")
SKCM <- read.csv("extra/SKCM.csv")
STAD <- read.csv("extra/STAD.csv")
THYM <- read.csv("extra/THYM.csv")
UCEC <- read.csv("extra/UCEC.csv")
UCS <- read.csv("extra/UCS.csv")

#### Clean and save final data ####

# bind all together
all_cancer <- rbind(LUSC, BLCA, BRCA, CESC, COAD, GBM, LGG, LUSC, MESO, PRAD, READ, SKCM, STAD, THYM, UCEC, UCS)

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
all_cancer_good <- select(all_cancer, good_col)
# save final dataset
write.csv(all_cancer_good, "extra/clinical.csv", row.names = FALSE)
