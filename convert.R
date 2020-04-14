# export R markdown to R scripts

library(knitr)
library(purrr)

# export R script for each R markdown class file
for (x in c(1:4)) {
  print(paste("Converting Class", x))
  # create R script
  purl(paste0("class", x, ".Rmd"), documentation = 0)
  # move to supplemental folder
  file.rename(paste0("class", x, ".R"), paste0("supplemental/class", x, ".R"))
}
