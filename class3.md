Introduction to R, Class 3: Data manipulation with tidyverse
================

<!--class3.md is generated from class3.Rmd. Please edit that file -->

## Objectives

In the last section, we imported a clinical cancer dataset and learned
to manipulate it using base R (tools included in every R installation).

In this session, we’ll continue to work with the same dataset, but will
introduce a set of tools specifically designed for data science in R. By
the end of this session, you should be able to:

  - install and load packages
  - use tidyverse tools to import data and access rows/columns
  - combine commands using pipes
  - transform and summarize data

## Installing and loading packages

Please ensure RStudio is open with your project directory path (e.g.,
`~/Desktop/intro_r`) listed at the top of your Console. If you do not
see the path to your project directory, go to `File -> Open Project` and
navigate to the location of your project directory. Alternatively, using
your operating system’s file browser, double click on the
`r_intro.Rrpoj` file.

Create a new R script called `class3.R`, and add `# Introduction to R:
Class 3` as a title.

For this lesson, we’ll be working with a group of R packages called
`tidyverse`. A package is a group of related functions that help you
accomplish particular tasks. [`tidyverse`](https://www.tidyverse.org)
packages have been designed specifically to support tasks related to
data science, such as data manipulation, filtering, and visualization.

The first thing we need to do is install the software:

``` r
# install package 
install.packages("tidyverse")
```

A few notes about installing packages:

  - You only need to perform this installation once per computer, or
    when updating R or the package.
  - If you see red text output in the Console during this installation,
    don’t be alarmed: this doens’t necessarily indicate a problem. You
    are seeing a report of the various pieces of software being
    downloaded and installed.
  - If prompted, you should install all packages (say yes or all), as
    well as yes to compiling any packages
  - When the installation is complete (this may take several minutes),
    you’ll see the command prompt (`>`) in your Console.

Once you have the software installed, you’ll need to load it:

``` r
# load library/package
library(tidyverse)
```

    ## ── Attaching packages ───────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.3     ✓ dplyr   1.0.1
    ## ✓ tidyr   1.1.1     ✓ stringr 1.4.0
    ## ✓ readr   1.3.1     ✓ forcats 0.5.0

    ## ── Conflicts ──────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

Loading packages is similar to opening a software application on your
computer; it makes a previously installed set of software available for
use. A few notes about loading packages:

  - You’ll need to load packages every time you open RStudio (or R
    restarts)
  - Loading `tidyverse` loads a collection of packages; these are listed
    under “Attaching packages”
  - There are many other packages included as dependencies. If some of
    them did not install successfully, you will receive an error at this
    step. For this lesson, you can try `library(dplyr)`, and ask your
    instructor for help later.
  - The section in the output above referencing “Conflicts” shows you
    which functions you just loaded have names identical to packages you
    already have loaded (in base R). This shouldn’t affect the code we
    write in this lesson, though it’s useful to know the double colon
    syntax (::) allows you to reference functions in a different package
    with same name.

You can check to make sure the new package we’ll be using is available
by executing `?select` in the Console, or by searching for that function
in the help panel. You can also look in the “Packages” tab in the same
panel. If the package (in this case, either `tidyverse` or `dplyr`) is
present in the list, it’s installed. If the box next to the package name
is checked, it’s loaded. In this lesson, if you receive an error saying
a function isn’t available or recognized, check to make sure the package
is loaded.

## Selecting columns and rows

The first task we’ll undertake with our newly installed `tidyverse`
tools is importing our data:

``` r
# import data
clinical <- read_csv("data/clinical.csv")
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

Note that this function looks similar to what we used in the last lesson
(`read.csv`), but the underscore replacing the dot means it’s actually a
different function. In fact, this is the data import function from
`tidyverse`. The output provided by this function indicates a few key
differences with our import yesterday.

The data import execution includes a description of how each variable
(column) is interpreted. In our data’s case, the numeric data are
`col_double` and the character data are `col_character` (not factors\!).

We can explore these differences further:

``` r
# inspect object
str(clinical)
```

    ## tibble [6,832 × 20] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ primary_diagnosis          : chr [1:6832] "C34.1" "C34.1" "C34.3" "C34.1" ...
    ##  $ tumor_stage                : chr [1:6832] "stage ia" "stage ib" "stage ib" "stage ia" ...
    ##  $ age_at_diagnosis           : num [1:6832] 24477 26615 28171 27154 29827 ...
    ##  $ vital_status               : chr [1:6832] "dead" "dead" "dead" "alive" ...
    ##  $ morphology                 : chr [1:6832] "8070/3" "8070/3" "8070/3" "8083/3" ...
    ##  $ days_to_death              : num [1:6832] 371 136 2304 NA 146 ...
    ##  $ state                      : chr [1:6832] "live" "live" "live" "live" ...
    ##  $ tissue_or_organ_of_origin  : chr [1:6832] "C34.1" "C34.1" "C34.3" "C34.1" ...
    ##  $ days_to_birth              : num [1:6832] -24477 -26615 -28171 -27154 -29827 ...
    ##  $ site_of_resection_or_biopsy: chr [1:6832] "C34.1" "C34.1" "C34.3" "C34.1" ...
    ##  $ days_to_last_follow_up     : num [1:6832] NA NA 2099 3747 NA ...
    ##  $ cigarettes_per_day         : num [1:6832] 10.96 2.19 1.64 1.1 NA ...
    ##  $ years_smoked               : num [1:6832] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ gender                     : chr [1:6832] "male" "male" "female" "male" ...
    ##  $ year_of_birth              : num [1:6832] 1936 1931 1927 1930 1923 ...
    ##  $ race                       : chr [1:6832] "white" "asian" "white" "white" ...
    ##  $ ethnicity                  : chr [1:6832] "not hispanic or latino" "not hispanic or latino" "not hispanic or latino" "not hispanic or latino" ...
    ##  $ year_of_death              : num [1:6832] 2004 2003 NA NA 2004 ...
    ##  $ bcr_patient_barcode        : chr [1:6832] "TCGA-18-3406" "TCGA-18-3407" "TCGA-18-3408" "TCGA-18-3409" ...
    ##  $ disease                    : chr [1:6832] "LUSC" "LUSC" "LUSC" "LUSC" ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   primary_diagnosis = col_character(),
    ##   ..   tumor_stage = col_character(),
    ##   ..   age_at_diagnosis = col_double(),
    ##   ..   vital_status = col_character(),
    ##   ..   morphology = col_character(),
    ##   ..   days_to_death = col_double(),
    ##   ..   state = col_character(),
    ##   ..   tissue_or_organ_of_origin = col_character(),
    ##   ..   days_to_birth = col_double(),
    ##   ..   site_of_resection_or_biopsy = col_character(),
    ##   ..   days_to_last_follow_up = col_double(),
    ##   ..   cigarettes_per_day = col_double(),
    ##   ..   years_smoked = col_double(),
    ##   ..   gender = col_character(),
    ##   ..   year_of_birth = col_double(),
    ##   ..   race = col_character(),
    ##   ..   ethnicity = col_character(),
    ##   ..   year_of_death = col_double(),
    ##   ..   bcr_patient_barcode = col_character(),
    ##   ..   disease = col_character()
    ##   .. )

You may notice the presence of `tbl` and related labels in the classes
for this object. `tbl` stands for
[tibble](https://tibble.tidyverse.org), which is a type of data frame
with specific constraints to ensure better data handling.

If you preview the dataset, it will look the same, and we can interact
with the data in the same way. These assumptions about the data mesh
nicely with the other tools in the `tidyverse`.

Now that our data are imported, we can explore the `tidyverse` functions
for extracting parts of the dataset.

First, we can explore selecting certain columns by name:

``` r
# selecting columns with tidyverse (dplyr)
sel_columns <- select(clinical, tumor_stage, ethnicity, disease)
```

The syntax for the `select` function is to specify the dataset first,
then the names of each of the columns you would like to retain in the
output object. If we look at the object, we’ll see it has only three
columns but all rows.

You’ll note that the column headers don’t require quotation marks; this
is a shortcut programmed into `tidyverse` functions.

As with base R functions, we can also select a range of columns:

``` r
# select range of columns
sel_columns2 <- select(clinical, tumor_stage:vital_status)
```

In addition to these approaches, we can also use other helper functions
for selecting columns: `starts_with()`, `ends_with()`, and `contains()`
are examples that assist in extracting columns with headers that meet
certain conditions. For example, using `starts_with(tumor)` in place of
the column names will give you all columns that start with the word
tumor.

We can use a separate function to extract rows that meet particular
conditions:

``` r
# select rows conditionally: keep only lung cancer cases
filtered_rows <- filter(clinical, disease == "LUSC") 
```

The syntax here is similar to `select`, and the conditional filters can
be applied in similarly to base R functions.

> #### Challenge-columns
> 
> Create a new object from clinical called race\_disease that includes
> only the race, \> ethnicity, and disease columns.

> #### Challenge-rows
> 
> Create a new object from race\_disease called race\_BRCA that includes
> only BRCA (from `disease`).

## Combining commands

The last challenges used an intermediate object to obtain an object with
two subsetting methods applied. It’s common in data science to apply
more than one requirement for extracting data. If you want to avoid
creating an intermediate object, you could nest one command inside the
other:

``` r
# same task as challenges, but nested commands 
race_BRCA2 <- select(filter(clinical, disease == "BRCA"), race, ethnicity, disease)
```

In this case, `filter(clinical, disease == "BRCA")` becomes the input
for `select`.

While this is a common approach, especially in base R, it can be
difficult for us as coders to read and interpret the code.

One of the most useful features of `tidyverse` is its inclusion of a
programming method called pipes. This approach can be found in many
programming languages, in part because of its utility: a pipe sends the
output from the lefthand side of the symbol as the input for the
righthand side. In R, pipes are represented as `%>%`.

We can use pipes to connect the same two data extraction tasks:

``` r
# same task as above, but with pipes
piped <- clinical %>%
  select(race, ethnicity, disease) %>%
  filter(disease == "BRCA")
```

The command above starts by naming the object that will result from this
assignment. The dataset is named as the first input. Because executing
the name of an object sends the object contents as output, this means
the second line receives the object as input. The output from the
`select` line is sent as input to the `filter` line. This effectively
demonstrates how pipes can be used to connect multiple commands
together.

> Now that we are running code in chunks that span multiple lines, you
> can see one of the other nice features of RStudio: your cursor can be
> placed on any line of the multi-line chunk when you execute, and the
> entire set of code will run together.

These examples also help highlight the importance of style and
convention in code formatting. After the first line, the code is
indented. While this isn’t necessary for the code to work, it does make
it a lot easier to read and understand the code.

Let’s take a look at another example of piped commands:

``` r
# extract race, ethinicity, and disease from cases born prior to 1930
piped2 <- clinical %>%
  filter(year_of_birth < 1930) %>%
  select(race, ethnicity, disease)
```

In the code above, we’re applying a mathematical condition to find
specific rows, and the selecting certain columns. Does the order of
commands differ? We can switch the order of the `filter` and `select`
lines to see:

``` r
piped3 <- clinical %>%
  select(race, ethnicity, disease) %>%
  filter(year_of_birth < 1930)
```

The code above should give you an error, because in this case, the order
does matter\! The output from the second line does not include the
`year_of_birth` column, so R is unable to apply the filter in the third
line.

> #### Challenge-pipes
> 
> Use pipes to extract the columns `gender`, `years_smoked`, and
> `year_of_birth` from the object `clinical` for only living patients
> (vital\_status) who have smoked fewer than 1 `cigarettes_per_day`.

## Mutate

This lesson so far has mostly shown new ways of accomplishing the same
tasks we learned in the last lesson. `tidyverse` includes much more
functionality, however, including the ability to `mutate` columns.
Common tasks for which `mutate` is useful include unit conversions,
transformation, and creating ratios from among existing columns.

We can use this function to convert the `days_to_death` column to years:

``` r
# convert days to years
clinical_years <- clinical %>%
  mutate(years_to_death = days_to_death / 365)
```

The actual conversion works by providing a formula (`days_to_death
/ 365`) and the name of the new column (`years_to_death`). If you
inspect the resulting object, you’ll see `years_to_death` added as a new
column at the end of the table.

> `mutate` works by retaining all previous columns and creating new
> columns as per the formula specified. `tidyverse` also includes
> `transmute`, which drops the existing columns used to calculcate the
> new columns.

We can use `mutate` to perform multiple conversions at once:

``` r
# convert days to year and months at same time, and we don't always need to assign to object
clinical %>%
  mutate(years_to_death = days_to_death / 365,
         months_to_death = days_to_death / 30) %>%
  glimpse() # preview data output
```

    ## Rows: 6,832
    ## Columns: 22
    ## $ primary_diagnosis           <chr> "C34.1", "C34.1", "C34.3", "C34.1", "C34.…
    ## $ tumor_stage                 <chr> "stage ia", "stage ib", "stage ib", "stag…
    ## $ age_at_diagnosis            <dbl> 24477, 26615, 28171, 27154, 29827, 23370,…
    ## $ vital_status                <chr> "dead", "dead", "dead", "alive", "dead", …
    ## $ morphology                  <chr> "8070/3", "8070/3", "8070/3", "8083/3", "…
    ## $ days_to_death               <dbl> 371, 136, 2304, NA, 146, NA, 345, 716, 28…
    ## $ state                       <chr> "live", "live", "live", "live", "live", "…
    ## $ tissue_or_organ_of_origin   <chr> "C34.1", "C34.1", "C34.3", "C34.1", "C34.…
    ## $ days_to_birth               <dbl> -24477, -26615, -28171, -27154, -29827, -…
    ## $ site_of_resection_or_biopsy <chr> "C34.1", "C34.1", "C34.3", "C34.1", "C34.…
    ## $ days_to_last_follow_up      <dbl> NA, NA, 2099, 3747, NA, 3576, NA, NA, 181…
    ## $ cigarettes_per_day          <dbl> 10.9589041, 2.1917808, 1.6438356, 1.09589…
    ## $ years_smoked                <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 2…
    ## $ gender                      <chr> "male", "male", "female", "male", "male",…
    ## $ year_of_birth               <dbl> 1936, 1931, 1927, 1930, 1923, 1942, 1953,…
    ## $ race                        <chr> "white", "asian", "white", "white", "not …
    ## $ ethnicity                   <chr> "not hispanic or latino", "not hispanic o…
    ## $ year_of_death               <dbl> 2004, 2003, NA, NA, 2004, NA, 2005, 2006,…
    ## $ bcr_patient_barcode         <chr> "TCGA-18-3406", "TCGA-18-3407", "TCGA-18-…
    ## $ disease                     <chr> "LUSC", "LUSC", "LUSC", "LUSC", "LUSC", "…
    ## $ years_to_death              <dbl> 1.0164384, 0.3726027, 6.3123288, NA, 0.40…
    ## $ months_to_death             <dbl> 12.366667, 4.533333, 76.800000, NA, 4.866…

The code above also features a new function, `glimpse`, that can be
useful when developing new piped code. Note that we did not assign the
output above to a new object; we allowed it to be printed to the
Console. Because this is a large dataset, that type of output can be
unweildy. `glimpse` allows us to see a preview of the data, including
the two new columns created.

> #### Challenge-lung
> 
> Extract only lung cancer patients (LUSC, from disease) and create a
> new column called `total_cig` representing an estimate of the total
> number of cigarettes smoked (use columns `years_smoked` and
> `cigarettes_per_day`).

## Split-apply-combine

Our `clinical` dataset includes categorical (character) data. One
example is the `gender` column. We can assess the different categories
available using a base R function:

``` r
# show categories in gender
unique(clinical$gender)
```

    ## [1] "male"   "female" NA

`tidyverse` includes an approach called split-apply-combine that allows
us to:

  - split data into groups,
  - apply a task for each group,
  - combine the results back together into a single table.

We can try out this approach by counting the number of each gender in
our dataset:

``` r
# count number of individuals of each gender
clinical %>%
  group_by(gender) %>%
  tally() 
```

    ## # A tibble: 3 x 2
    ##   gender     n
    ##   <chr>  <int>
    ## 1 female  3535
    ## 2 male    3258
    ## 3 <NA>      39

`group_by` is not particularly useful by itself, but powerful together
with a second function like `tally`. The two columns in the resulting
tibble represent the categories from `group_by` and the number of cases
for each gender (n).

An additional function for use with `group_by` is `summarize`:

``` r
# summarize average days to death by gender
clinical %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death, na.rm = TRUE))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 3 x 2
    ##   gender mean_days_to_death
    ##   <chr>               <dbl>
    ## 1 female               947.
    ## 2 male                 826.
    ## 3 <NA>                 NaN

Similar to `mutate`, we provide `summarize` with a formula indicating
how we would like the groups to be handled.

In the command above, we use `na.rm = TRUE` to exclude missing data from
the calculation of mean from `days_to_death`. We still have `NA`
reported in the output table, though, because of the `NA` category in
`gender`.

We can apply an additional filter to remove this missing data, prior to
grouping:

``` r
# remove NA
clinical %>%
  filter(!is.na(gender)) %>%
  group_by(gender) %>%
  summarize(mean_days_to_death = mean(days_to_death))
```

    ## `summarise()` ungrouping output (override with `.groups` argument)

    ## # A tibble: 2 x 2
    ##   gender mean_days_to_death
    ##   <chr>               <dbl>
    ## 1 female                 NA
    ## 2 male                   NA

> #### Challenge-smoke-complete
> 
> Create object called smoke\_complete from clinical that contains no
> missing data for cigarettes per day or age at diagnosis.

> #### Challenge-save
> 
> How do you save resulting table to file? How would you find this
> answer?

The solution to the challenges above represent the first of two datasets
we’ll be using for data visualization in our next class. Make sure
you’ve executed this code to save the filtered data file for use next
time:

``` r
smoke_complete <- clinical %>%
  filter(!is.na(age_at_diagnosis)) %>%
  filter(!is.na(cigarettes_per_day))
write_csv(smoke_complete, "data/smoke_complete.csv")
```

The command above uses `write_csv`, which is the `tidyverse` method of
saving a csv file. Base R possesses a function, `write.csv`, that
performs a similar task, but by default includes quotation marks around
cells with character data as well as row names (sequential numbers,
unless otherwise specified).

> #### Challenge-birth-complete
> 
> Create a new object called birth\_complete that contains no missing
> data for year of birth or vital status.

This challenge begins filtering the second of our two datasets for next
time. Make sure you include the filter to remove missing data that’s
been encoded as “not reported”\!

``` r
# make sure ALL missing data is removed!
birth_complete <- clinical %>%
  filter(!is.na(year_of_birth)) %>%
  filter(!is.na(vital_status)) %>%
  filter(vital_status != "not reported")
```

## Filtering data based on number of cases of each type

We’re going to perform one last manipulation on this second dataset for
next time, which will allow us to reduce the total number of cancer
types present in this dataset.

First, we’ll need to count how many cases for each cancer type exist in
the dataset:

``` r
# counting number of records in each cancer
cancer_counts <- clinical %>%
  count(disease) %>%
  arrange(n) 
```

The `count` function is similar to `tally`, but doesn’t need to have
`group_by` applied first. The `arrange` function added at the end sorts
the table using the column specified. Although this isn’t necessary for
the analysis to proceed, it makes it easier for us to interpret the
results.

Next, we’ll identify which cancer types are represented by at least 500
cases in this dataset:

``` r
# get names of frequently occurring cancers
frequent_cancers <- cancer_counts %>%
  filter(n >= 500) 
```

We can then use this object to filter based on the number of cases:

``` r
# extract data from cancers to keep
birth_reduced <- birth_complete %>%
  filter(disease %in% frequent_cancers$disease)
```

The new syntax here is `%in%`, which allows you to compare each entry in
`disease` from `birth_complete` to the disease column in
`frequent_cancers` (remember that `frequent_cancers$disease` means the
`disease` column from `frequent_cancers`). This keeps only cases from
the `birth_complete` dataset that are from cancers that are frequently
occurring.

Finally, we’ll write the final output to a file:

``` r
# save results to file in data/ named birth_reduced
write_csv(birth_reduced, "data/birth_reduced.csv")
```

> #### Challenge-tumor
> 
> Extract all tumor stages with more than 200 cases (Hint: also check to
> see if there are any other missing/ambiguous data\!)

## Wrapping up

In this session, we acquainted ourselves with `tidyverse`, and learned
some tools for data filtering and manipulation. We covered examples from
many of the main categories of data manipulation tasks; if you’d like
more information on these functions and others available (including
methods of joining multiple tables together), please check out the
[`dplyr`
cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf).

In the next session, we’ll wrap up the course by creating
publication-quality images using `ggplot2`, a data visualization package
in `tidyverse`, and the two datasets we filtered in the sections above.

**This document is written in [R
markdown](http://rmarkdown.rstudio.com),** which is a method of
formatting text, code, and output to create documents that are sharable
with other people. While this document is intended to serve as a
reference for you to read while typing code into your own script, you
may also be interested in modifying and running code in the original R
markdown file ([`class3.Rmd`](class3.Rmd) in the GitHub repository).

Materials for all lessons in this course include:

  - [Class 1](class1.md): R syntax, assigning objects, using functions
  - [Class 2](class2.md): Data types and structures; slicing and
    subsetting data
  - [Class 3](class3.md): Data manipulation with `dplyr`
  - [Class 4](class4.md): Data visualization in `ggplot2`

## Extra exercises

Answers to all challenge exercises are available [here](solutions/).

The following exercises all use the same `clinical` data from this
class.

#### Challenge-ethnicity

How many hispanic or latino individuals in clinical are not also white?
What are their races?

#### Challenge-years

Create a new column for clinical called `age_at_death` that calculates
this statistic (in years) from `year_of_birth` and `year_of_death`.

#### Challenge-helpers

`dplyr` includes several “helpers” that allows selection of columns
meeting particular criteria (described on the first page of the dplyr
cheatsheet near the top of the right hand column:
<https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf>).
Using one of these tools, extract all columns that include “diagnosis”.

#### Challenge-combine

How many patients are hispanic or latino patients (column ethnicity),
died after the year 2000 (year\_of\_death), and possess no missing data
for cigarettes per day?
