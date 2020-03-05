#### Intro to R: data visualization with ggplot2 ####

#### Objectives ####

# review previous weeks' material

# Today:
#   creating and modifying scatterplots and boxplots
#   representing time series data as line plots
#   splitting into multiple panels
#   customizing plots

#### Setting up ####

# install package
#install.packages("tidyverse") # watch for popup on lab computers to complete install
# load library/package
library(tidyverse) # needs to happen every time R restarts
# check dplyr installation
?select
# check ggplot2 installation
?ggplot

# if data filtering wasn't completed last week, can import from backup files on GitHub
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/birth_reduced.csv", "data/birth_reduced.csv")
download.file("https://raw.githubusercontent.com/fredhutchio/R_intro/master/extra/smoke_complete.csv", "data/smoke_complete.csv")

# reading in data and saving to object
birth_reduced <- read_csv("data/birth_reduced.csv")
smoke_complete <- read_csv("data/smoke_complete.csv")

# create directory for output
dir.create("figures")

# simple plot from base R
plot(x=smoke_complete$age_at_diagnosis, y=smoke_complete$cigarettes_per_day)

#### Intro to ggplot2 and scatterplots ####

# create a simple ggplot
# bind data to new plot
# specify aesthetic: mapping data to plot
# layers: visual representation of plot, including ways (geometries/shapes) through which data are represented and themes (everything but data)
ggplot(data = smoke_complete) + # bind data
  geom_point(mapping = aes(x = age_at_diagnosis, y = cigarettes_per_day)) # map aesthetic with layer (geom)

# building plots iteratively
# add transparency (and remove argument labels, they are implied)
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day), alpha = 0.1)

# add color
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day), alpha = 0.1, color = "green")

# color points by variable
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease), alpha = 0.1)
# why don't we need parentheses around disease?

# change background theme
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease), alpha = 0.1) +
  theme_bw()

# add title and custom axis labels
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease), alpha = 0.1) +
  labs(title = "Age at diagnosis vs cigarettes per day",
       x="age (days)",
       y="cigarettes per day") +
  theme_bw()

# save plot to file
ggsave("figures/awesomePlot.jpg", width = 10, height = 10, dpi = 300)

## Challenge: create a scatterplot showing age at diagnosis vs years smoked with points colored by gender and appropriate axis labels

#### Box and whisker plots ####

# creating a box and whisker plot
ggplot(smoke_complete) +
  geom_boxplot(aes(x=vital_status, y=cigarettes_per_day))

# adding color
ggplot(smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot(aes(x=vital_status, y=cigarettes_per_day), color="tomato")

# adding colored points to black box and whisker plot
ggplot(smoke_complete) +
  geom_boxplot(aes(x=vital_status, y=cigarettes_per_day)) +
  geom_jitter(aes(x=vital_status, y=cigarettes_per_day), alpha = 0.3, color = "blue")

# ggplot2 documentation: https://ggplot2.tidyverse.org
# cheat sheet: https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf

## Challenge: Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions. What is the advantage of writing code like this?
my_plot <- ggplot(smoke_complete, aes(x=vital_status, y=cigarettes_per_day)) 
my_plot +
  geom_boxplot() +
  geom_jitter(alpha = 0.2, color = "purple")
# note: this is how many ggplot tutorials show iterative plotting!

## Challenge: In the last plot, does the order of layers matter?

#### BREAK ####

#### Plotting time series data (line plots) ####

# count number of observations for each disease by year of birth
yearly_counts <- birth_reduced %>%
  count(year_of_birth, disease) 

# plot all counts by year
ggplot(yearly_counts) +
  geom_line(aes(x=year_of_birth, y=n))

# plot one line per cancer type
ggplot(yearly_counts) +
  geom_line(aes(x=year_of_birth, y=n, 
                group=disease))

# color each line per cancer type
ggplot(yearly_counts) +
  geom_line(aes(x=year_of_birth, y=n, 
                group=disease, color = disease)) # group isn't necessary if you are coloring by a category!

## Challenge: create a plot of birth year and number of patients with two lines representing each gender 

## Challenge: how do you show differences in lines using dashes/dots instead of color?

#### Faceting ####

# use previous scatterplot, but separate panels by disease
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_wrap(vars(disease))
# wraps panels to make a square/rectangular plot

# add a variable by leaving color but changing panels to other categorical data
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_wrap(vars(tumor_stage))
# more categories, but wrapped to keep close to a square

# arrange plots via a formula: vital status in rows, disease in columns
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_grid(vars(vital_status), vars(disease))

# switch rows and columns
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_grid(vars(disease), vars(vital_status))

# control arrangement of plots, even when only using grid with one variable
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_grid(rows= vars(vital_status))       

# switch column for row
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_grid(cols = vars(vital_status)) 

## Challenge: alter your last challenge plot of (birth year by number of patients) to show each gender in separate panels

#### Optional: Customization ####

# modify axis text labels
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_wrap(vars(disease)) + # facet plot
  labs(title = "Vital status by year of birth", # plot title
       x = "year of birth", y = " number of patients") + # axis labels
  theme_bw() + # add black and white theme
  theme(axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0.5), # rotate and adjust x axis
        text = element_text(size = 16)) # increase all font size

# save theme changes
grey_theme <- theme(axis.text.x = element_text(colour = "grey20", 
                        size = 12,angle = 90, hjust = 0.5, vjust = 0.5),
                    axis.text.y = element_text(colour = "grey20", size = 12))

# apply theme changes and add axis labels
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_wrap(vars(disease)) + # facet plot
  labs(title = "Vital status by year of birth", # plot title
       x = "year of birth", y = " number of patients") + # axis labels
  theme_bw() +
  grey_theme

## Challenge: find way to change axes, like tick marks, labels, lines, etc (Google search!)

## Challenge: improve one of the plots previously created today, by changing thickness of lines, name of legend, or color palette (http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/)

#### Wrapping up ####

# review this class' objectives
# direct towards practice questions (linked in HackMD)
# review course objectives
# direct to additional resources available on HackMD
# reminder about course evaluations and when HackMD page will be cleared
