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
write.csv(LUSC, "LUSC.csv", row.names = FALSE)
write.csv(BLCA, "BLCA.csv", row.names = FALSE)
write.csv(BRCA, "BRCA.csv", row.names = FALSE)
write.csv(CESC, "CESC.csv", row.names = FALSE)
write.csv(COAD, "COAD.csv", row.names = FALSE)
write.csv(GBM, "GBM.csv", row.names = FALSE)
write.csv(LGG, "LGG.csv", row.names = FALSE)
write.csv(MESO, "MESO.csv", row.names = FALSE)
write.csv(PRAD, "PRAD.csv", row.names = FALSE)
write.csv(READ, "READ.csv", row.names = FALSE)
write.csv(SKCM, "SKCM.csv", row.names = FALSE)
write.csv(STAD, "STAD.csv", row.names = FALSE)
write.csv(THYM, "THYM.csv", row.names = FALSE)
write.csv(UCEC, "UCEC.csv", row.names = FALSE)
write.csv(UCS, "UCS.csv", row.names = FALSE)
# load raw data
LUSC <- read.csv("LUSC.csv")
BLCA <- read.csv("BLCA.csv")
BRCA <- read.csv("BRCA.csv")
CESC <- read.csv("CESC.csv")
COAD <- read.csv("COAD.csv")
GBM <- read.csv("GBM.csv")
LGG <- read.csv("LGG.csv")
MESO <- read.csv("MESO.csv")
PRAD <- read.csv("PRAD.csv")
READ <- read.csv("READ.csv")
SKCM <- read.csv("SKCM.csv")
STAD <- read.csv("STAD.csv")
THYM <- read.csv("THYM.csv")
UCEC <- read.csv("UCEC.csv")
UCS <- read.csv("UCS.csv")

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
write.csv(all_cancer_good, "clinical.csv", row.names = FALSE)
