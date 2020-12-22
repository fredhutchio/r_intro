Introduction to R, Class 3: Solutions
================

<!--class3_solutions.md is generated from class3_solutions.Rmd. Please edit that file -->

#### Challenge-columns

``` r
race_disease <- select(clinical, race, ethnicity, disease)
```

#### Challenge-rows

``` r
race_BRCA <- filter(race_disease, disease == "BRCA")
```

#### Challenge-pipes

``` r
clinical %>%
  filter(vital_status == "alive") %>%
  filter(cigarettes_per_day < 1) %>%
  select(gender, years_smoked, year_of_birth) %>%
  head() # output only the first few lines
```

    ##   gender years_smoked year_of_birth
    ## 1 female           NA          1940
    ## 2 female           NA          1928
    ## 3 female           NA          1942
    ## 4 female           28          1924
    ## 5   male           NA            NA
    ## 6   male           31          1941

#### Challenge-lung

``` r
clinical %>%
  filter(disease == "LUSC") %>%
  mutate(total_cig = years_smoked * cigarettes_per_day * 365) %>%
  head() # output only the first few lines
```

    ##   primary_diagnosis tumor_stage age_at_diagnosis vital_status morphology
    ## 1             C34.1    stage ia            24477         dead     8070/3
    ## 2             C34.1    stage ib            26615         dead     8070/3
    ## 3             C34.3    stage ib            28171         dead     8070/3
    ## 4             C34.1    stage ia            27154        alive     8083/3
    ## 5             C34.3   stage iib            29827         dead     8070/3
    ## 6             C34.1  stage iiia            23370        alive     8070/3
    ##   days_to_death state tissue_or_organ_of_origin days_to_birth
    ## 1           371  live                     C34.1        -24477
    ## 2           136  live                     C34.1        -26615
    ## 3          2304  live                     C34.3        -28171
    ## 4            NA  live                     C34.1        -27154
    ## 5           146  live                     C34.3        -29827
    ## 6            NA  live                     C34.1        -23370
    ##   site_of_resection_or_biopsy days_to_last_follow_up cigarettes_per_day
    ## 1                       C34.1                     NA          10.958904
    ## 2                       C34.1                     NA           2.191781
    ## 3                       C34.3                   2099           1.643836
    ## 4                       C34.1                   3747           1.095890
    ## 5                       C34.3                     NA                 NA
    ## 6                       C34.1                   3576           2.739726
    ##   years_smoked gender year_of_birth         race              ethnicity
    ## 1           NA   male          1936        white not hispanic or latino
    ## 2           NA   male          1931        asian not hispanic or latino
    ## 3           NA female          1927        white not hispanic or latino
    ## 4           NA   male          1930        white not hispanic or latino
    ## 5           NA   male          1923 not reported           not reported
    ## 6           NA female          1942 not reported           not reported
    ##   year_of_death bcr_patient_barcode disease total_cig
    ## 1          2004        TCGA-18-3406    LUSC        NA
    ## 2          2003        TCGA-18-3407    LUSC        NA
    ## 3            NA        TCGA-18-3408    LUSC        NA
    ## 4            NA        TCGA-18-3409    LUSC        NA
    ## 5          2004        TCGA-18-3410    LUSC        NA
    ## 6            NA        TCGA-18-3411    LUSC        NA

#### Challenge-smoke-complete

``` r
smoke_complete <- clinical %>%
  filter(!is.na(age_at_diagnosis)) %>%
  filter(!is.na(cigarettes_per_day))
```

#### Challenge-save

``` r
write.csv(smoke_complete, "data/smoke_complete.csv", row.names = FALSE)
```

Google search for “save file R”.

#### Challenge-birth-complete

``` r
birth_complete <- clinical %>%
  filter(!is.na(year_of_birth)) %>%
  filter(!is.na(vital_status)) %>%
  filter(vital_status != "not reported")
```

#### Challenge-tumor

``` r
# counting number of records for each tumor stage
tumor_counts <- clinical %>%
  count(tumor_stage)
# get names of tumors with many cases
frequent_tumors <- tumor_counts %>%
  filter(n > 200)
# extract data from cancers to keep
tumor_reduced <- clinical %>%
  filter(tumor_stage %in% frequent_tumors$tumor_stage)
```

## Extra exercises

#### Challenge-ethnicity

``` r
clinical %>%
  filter(race != "white") %>% # only non-white individuals
  filter(ethnicity == "hispanic or latino") %>% # only hispanic/latino
  group_by(race) %>% # group by other races
  tally() # count total for each race
```

    ## # A tibble: 5 x 2
    ##   race                                          n
    ##   <chr>                                     <int>
    ## 1 american indian or alaska native              7
    ## 2 asian                                         1
    ## 3 black or african american                    12
    ## 4 native hawaiian or other pacific islander     1
    ## 5 not reported                                 24

#### Challenge-years

``` r
clinical <- clinical %>%
  mutate(age = year_of_death - year_of_birth)
```

#### Challenge-helpers

``` r
# preferred way
clinical %>%
  select(contains("diagnosis")) %>%
  head() # output only the first few lines
```

    ##   primary_diagnosis age_at_diagnosis
    ## 1             C34.1            24477
    ## 2             C34.1            26615
    ## 3             C34.3            28171
    ## 4             C34.1            27154
    ## 5             C34.3            29827
    ## 6             C34.1            23370

``` r
# also works, but only because in this example both columns end in "diagnosis"
clinical %>%
  select(ends_with("diagnosis")) %>%
  head() # output only the first few lines
```

    ##   primary_diagnosis age_at_diagnosis
    ## 1             C34.1            24477
    ## 2             C34.1            26615
    ## 3             C34.3            28171
    ## 4             C34.1            27154
    ## 5             C34.3            29827
    ## 6             C34.1            23370

#### Challenge-combine

``` r
clinical %>%
  filter(ethnicity == "hispanic or latino") %>%
  filter(year_of_death > 2000) %>%
  filter(!is.na(cigarettes_per_day)) %>%
  count()
```

    ##    n
    ## 1 11
