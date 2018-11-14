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

# reading in data and saving to object
birth_reduced <- read.csv("data/birth_reduced.csv")
smoke_complete <- read.csv("data/smoke_complete.csv")

# create directory for output
dir.create("figures")

# stupid plot
plot(x=smoke_complete$age_at_diagnosis, y=smoke_complete$cigarettes_per_day)

#### Intro to ggplot2 and scatterplots ####

# create a simple ggplot
# bind data to new plot
# specify aesthetic: mapping data to plot
# layers: ways (shapes) through which data are represented
ggplot(data = smoke_complete, 
       aes(x = age_at_diagnosis, y = cigarettes_per_day)) +
  geom_point()

# save plot to object
smoke_plot <- ggplot(data = smoke_complete, 
                        aes(x = age_at_diagnosis, y = cigarettes_per_day))
# draw the plot
smoke_plot +
  geom_point()

# building plots iteratively
# add transparency
smoke_plot +
  geom_point(alpha=0.1)

# add color
smoke_plot +
  geom_point(alpha=0.1, color="green")

# color points by variable
smoke_plot +
  geom_point(alpha=0.1, aes(color = disease))

# change background theme
smoke_plot +
  geom_point(alpha=0.1, aes(color = disease)) +
  theme_bw()

# add title and custom axis labels
smoke_plot +
  geom_point(alpha=0.1, aes(color = disease)) +
  labs(title = "Age at diagnosis vs cigarettes per day",
       x="age (days)",
       y="cigarettes per day") +
  theme_bw()

## Challenge: create a scatterplot showing age at diagnosis vs years smoked with points colored by gender

# save plot to file
ggsave("figures/awesomePlot.jpg")

#### Box and whisker plots ####

# creating a box and whisker plot
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot()

# adding color
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot(color="tomato")

# adding colored points to black box and whisker plot
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.3, color = "blue")

# ggplot2 documentation: https://ggplot2.tidyverse.org
# cheat sheet: https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf

## Challenge: does the order of geom layers matter?

## Challenge: visualize the same data as a violin plot in a color of your choice

#### Plotting time series data (line plots) ####

# count number of observations for each disease by year of birth
yearly_counts <- birth_reduced %>%
  count(year_of_birth, disease) 

# plot all counts by year
ggplot(data=yearly_counts, 
       aes(x=year_of_birth, y=n)) +
  geom_line()

# plot one line per cancer type
ggplot(data=yearly_counts, 
       aes(x=year_of_birth, y=n, 
           group=disease)) +
  geom_line()

# color each line per cancer type
ggplot(data=yearly_counts, 
       aes(x=year_of_birth, y=n, 
           group=disease, color = disease)) +
  geom_line()

## Challenge: create a plot of birth year and number of patients with two lines representing the number of patients of each gender 

## Challenge: how do you change the line type instead of color?

#### Faceting ####

# count observations by disease, year of birth, and vital status
yearly_vital_counts <- birth_reduced %>%
  count(year_of_birth, disease, vital_status)

# plot each cancer type in separate panels with lines colored by vital status
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease)

# plot each vital status in separate panels with lines colored by disease
ggplot(data = yearly_vital_counts, 
       aes(x = year_of_birth, y = n, color = disease)) +
  geom_line() +
  facet_grid(vital_status ~ .)       

# change arrangement of panels
ggplot(data = yearly_vital_counts, 
       aes(x = year_of_birth, y = n, color = disease)) +
  geom_line() +
  facet_grid(. ~ vital_status)  

# plot diseases and vital statuses in different panels
ggplot(data = yearly_vital_counts, 
       aes(x = year_of_birth, y = n, color = disease)) +
  geom_line() +
  facet_grid(vital_status ~ disease)   

## Challenge: alter your last challenge plot of (birth year by number of patients) to show each gender in separate panels

#### Customization ####

# rotate font
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + # facet plot
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
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  labs(title = "Vital status by year of birth",
       x = "year of birth", y = " number of patients") +
  theme_bw() +
  grey_theme

## Challenge: find way to change axes, like tick marks, labels, lines, etc (Google search!)

## Challenge: improve one of the plots previously created today, by changing thickness of lines, name of legend, or color palette (http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/)

#### Wrapping up ####

# review this class' objectives
# review course objectives
# preview other intermediate courses available
# ask for other courses to offer
# course evaluations
