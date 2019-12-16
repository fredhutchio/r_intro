#### Reading SAS datasets into R
library(tidyverse)

# Part of the tidyverse, but needs to be loaded separately. You can read more about it here:
# https://haven.tidyverse.org/
library(haven) 

# Download some toy SAS data
# SAS dataset
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/iris.sas7bdat", 
              "data/iris.sas7bdat")
# SAS catalog file
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/formats.sas7bcat" , 
              "data/formats.sas7bcat")

# The read_sas function is provided by Haven.
sas_iris <- read_sas("data/iris.sas7bdat")

# read_sas returns a tibble object, which we can inspect
sas_iris

# Choose which columns/row are read
read_sas("iris.sas7bdat", col_select = c("Sepal_Length", "Petal_Length"))
read_sas("iris.sas7bdat", n_max = 5)

# The length and width variables make sense, but Species is probably 
# categorical. The read_sas function can also read a SAS catalog file and apply 
# Categorical labels
sas_iris <- read_sas("data/iris.sas7bdat", catalog_file = "data/formats.sas7bcat")
sas_iris

# Read SAS does not automatically convert categorical variables into factors.
# Instead, it creates an intermediate type called a labeled double. These can
# be converted to factors using the as_factor function provided by Haven (Note
# the underscore instead of the ".")
as_factor(sas_iris)

# Combine the read step with the factor conversion using the pipe
sas_iris <- 
	read_sas("data/iris.sas7bdat", catalog_file = "data/formats.sas7bcat") %>%
	as_factor()

# Now when we inspect sas_iris, we see that our Species variable is a factor as expected
sas_iris

