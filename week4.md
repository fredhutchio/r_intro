Week 4: Data Visualization
================

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

``` r
# load library
library(tidyverse)
```

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.2.1     ✓ purrr   0.3.3
    ## ✓ tibble  2.1.3     ✓ dplyr   0.8.3
    ## ✓ tidyr   1.0.0     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.4.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
# read in filtered data from last week
birth_reduced <- read_csv("data/birth_reduced.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   age_at_diagnosis = col_double(),
    ##   days_to_death = col_double(),
    ##   days_to_birth = col_double(),
    ##   days_to_last_follow_up = col_double(),
    ##   cigarettes_per_day = col_double(),
    ##   years_smoked = col_double(),
    ##   year_of_birth = col_double(),
    ##   year_of_death = col_double()
    ## )

    ## See spec(...) for full column specifications.

``` r
smoke_complete <- read_csv("data/smoke_complete.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_character(),
    ##   age_at_diagnosis = col_double(),
    ##   days_to_death = col_double(),
    ##   days_to_birth = col_double(),
    ##   days_to_last_follow_up = col_double(),
    ##   cigarettes_per_day = col_double(),
    ##   years_smoked = col_double(),
    ##   year_of_birth = col_double(),
    ##   year_of_death = col_double()
    ## )
    ## See spec(...) for full column specifications.

``` r
# create directory for output
dir.create("figures")
```

    ## Warning in dir.create("figures"): 'figures' already exists

``` r
# simple plot from base R from the smoke_complete dataset
plot(x=smoke_complete$age_at_diagnosis, y=smoke_complete$cigarettes_per_day)
```

![](week4_files/figure-gfm/prep-1.png)<!-- -->

## Intro to ggplot2 and scatterplots

There are three steps to creating a ggplot: 1. bind data: create a new
plot with a designated dataset 2. specify the aesthetic: maps the data
to axes on a plot 3. add layers: visual representation of plot,
including ways (geometries or shapes) through which data are represented
and themes; layers represent everything about the way data are presented

``` r
# basic ggplot
ggplot(data = smoke_complete) # bind data to plot
```

![](week4_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

The last line of code creates an empty plot, since we didn’t include any
instructions for how to

``` r
# basic ggplot
ggplot(data = smoke_complete, aes(x = age_at_diagnosis, 
                           y = cigarettes_per_day)) # specify aesthetics (axes)
```

![](week4_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

``` r
ggplot(data = smoke_complete,
       mapping = aes(x = age_at_diagnosis, y = cigarettes_per_day)) + 
  geom_point() # add a layer of geometry
```

![](week4_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
