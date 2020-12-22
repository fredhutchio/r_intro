Introduction to R, Class 2: Solutions
================

<!--class2_solutions.md is generated from class2_solutions.Rmd. Please edit that file -->

#### Challenge-data

``` r
# example1: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.tsv
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.tsv", "data/clinical.tsv")
clinical_tsv <- read.delim("data/clinical.tsv")
# example2: https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/clinical.txt", "data/clinical.txt")
clinical_txt <- read.table("data/clinical.txt", header=TRUE)
```

It’s also possible to read data into R directly using `read.csv(URL)`,
but it’s often better practice to download data file for reference.

#### Challenge-extract

``` r
# extract first column, assigning each result to object to show that data structure differs between output
test <- clinical[ , 1]
test2 <- clinical[1]
class(test) # factor (technically, a vector of factors)
```

    ## [1] "character"

``` r
class(test2) # data.frame
```

    ## [1] "data.frame"

#### Challenge-days

``` r
clinical$days_to_death
clinical[6]
clinical[,6]
clinical[[6]]
clinical["days_to_death"] 
clinical[ , "days_to_death"] 
clinical[["days_to_death"]]
```

#### Challenge-rows

``` r
clinical[1:6, c(3, 6)]
```

    ##   age_at_diagnosis days_to_death
    ## 1            24477           371
    ## 2            26615           136
    ## 3            28171          2304
    ## 4            27154            NA
    ## 5            29827           146
    ## 6            23370            NA

#### Challenge-calculate

``` r
range(clinical$cigarettes_per_day, na.rm = TRUE)
```

    ## [1]  0.008219178 40.000000000

``` r
mean(clinical$cigarettes_per_day, na.rm = TRUE)
```

    ## [1] 2.599307

#### Challenge-not-reported

``` r
clinical <- read.csv("../data/clinical.csv", stringsAsFactors = TRUE)
ethnicity <- clinical$ethnicity
levels(ethnicity) # show levels of factor
```

    ## [1] "hispanic or latino"     "not hispanic or latino" "not reported"

``` r
# rename factors
levels(ethnicity)[3] <- NA
# replace race in data frame
clinical$ethnicity <- ethnicity
# check to see it worked
levels(ethnicity)
```

    ## [1] "hispanic or latino"     "not hispanic or latino"

#### Challenge-remove

Perform a Google search to find additional strategies for renaming
missing data. For the search “replace missing data R”, the following
result provides a lot of options:
<https://stackoverflow.com/questions/8161836/how-do-i-replace-na-values-with-zeros-in-an-r-dataframe>

## Extra exercises

#### Challenge-disease-race

``` r
# show index positions of column names
names(clinical)
```

    ##  [1] "primary_diagnosis"           "tumor_stage"                
    ##  [3] "age_at_diagnosis"            "vital_status"               
    ##  [5] "morphology"                  "days_to_death"              
    ##  [7] "state"                       "tissue_or_organ_of_origin"  
    ##  [9] "days_to_birth"               "site_of_resection_or_biopsy"
    ## [11] "days_to_last_follow_up"      "cigarettes_per_day"         
    ## [13] "years_smoked"                "gender"                     
    ## [15] "year_of_birth"               "race"                       
    ## [17] "ethnicity"                   "year_of_death"              
    ## [19] "bcr_patient_barcode"         "disease"

``` r
# extract desired object
disease_race <- clinical[6733:6832, c(20, 16)]
```

#### Challenge-min-max

``` r
min(clinical$days_to_death, na.rm = TRUE)
```

    ## [1] 0

``` r
max(clinical$days_to_death, na.rm = TRUE)
```

    ## [1] 10870

``` r
range(clinical$days_to_death, na.rm = TRUE) # does both together
```

    ## [1]     0 10870

``` r
summary(clinical$days_to_death) # all summary stats for this answer
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##     0.0   274.0   524.0   878.2  1044.5 10870.0    4645

#### Challenge-factors

``` r
# save column to object
race <- clinical$race 
# recall levels of object
levels(race) 
```

    ## [1] "american indian or alaska native"         
    ## [2] "asian"                                    
    ## [3] "black or african american"                
    ## [4] "native hawaiian or other pacific islander"
    ## [5] "not reported"                             
    ## [6] "white"

``` r
# rename factors
levels(race)[1] <- "American Indian"
levels(race)[2] <- "Asian"
levels(race)[3] <- "black"
levels(race)[4] <- "Pacific Islander"
levels(race)[5] <- NA
# recall levels of object
levels(race) 
```

    ## [1] "American Indian"  "Asian"            "black"            "Pacific Islander"
    ## [5] "white"

``` r
# replace race in data frame
clinical$race <- race
```
