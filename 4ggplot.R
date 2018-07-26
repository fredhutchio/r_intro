#### Intro to R: data visualization with ggplot2 ####

# install package
#install.packages("tidyverse") # watch for popup on lab computers to complete install
# load library/package
library(tidyverse) # needs to happen every time R restarts
# check dplyr installation
?select
# check ggplot2 installation
?ggplot

#### Setting up ####

# reading in data and saving to object
birth_reduced <- read.csv("data/birth_reduced.csv")
smoke_complete <- read.csv("data/smoke_complete.csv")

# create directory for output
dir.create("figures")

# stupid plot
plot(x=smoke_complete$age_at_diagnosis, y=smoke_complete$cigarettes_per_day)

#### Intro to ggplot2 and scatterplots ####

# create a simple ggplot
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

## Challenge:

# save plot to file
ggsave("figures/awesomePlot.jpg")

#### Box and whisker plots ####

# creating a box and whisker plot
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot(color="tomato")

# adding colored points to box and whisker plot
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot() +
  geom_jitter(alpha = 0.3, color = "blue")

# Challenge: violin plot

#### Plotting time series data (line plots) ####

## count number of observations for each species by year
yearly_counts <- birth_reduced %>%
  count(year_of_birth, disease) 

# plot all species by year
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

## Challenge:

#### Faceting ####

# make separate time series plots for each cancer type
ggplot(data=yearly_counts, 
       aes(x=year_of_birth, y=n)) +
  geom_line() +
  facet_wrap(~ disease)

# split line for each plot into vital status
ggplot(data=yearly_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease)
# why doesn't this work?

# split line for each plot into vital status
# create new dataset
yearly_vital_counts <- birth_reduced %>%
  count(year_of_birth, disease, vital_status)

# create plot with new data
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease)

# change theme and remove grid
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  theme_bw() +
  theme(panel.grid = element_blank())

# facet in one column and variables in rows

