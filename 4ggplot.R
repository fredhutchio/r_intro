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

## Challenge: create a scatterplot showing age at diagnosis vs years smoked with points colored by gender

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

# Challenge: visualize the same data as a violin plot in a color of your choice

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

## Challenge: create a plot of birth year with two lines representing the number of patients of each gender 

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
yearly_vital_birth <- birth_reduced %>%
  group_by(year_of_birth, vital_status, disease) %>%
  summarize(avg_age = mean(age_at_diagnosis))
ggplot(data = yearly_vital_birth, 
       aes(x = year_of_birth, y = avg_age, color = disease)) +
  geom_line() +
  facet_grid(vital_status ~ .)       

# facet in one row and variables in column
ggplot(data = yearly_vital_birth, 
       aes(x = year_of_birth, y = avg_age, color = disease)) +
  geom_line() +
  facet_grid(. ~ vital_status)  

#### Customization ####

# changing axes
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  labs(title = "Vital status by year of birth",
       x = "year of birth", y = " number of patients") +
  theme_bw() 

# increase font size
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  labs(title = "Vital status by year of birth",
       x = "year of birth", y = " number of patients") +
  theme_bw() +
  theme(text = element_text(size=16))

# increase font size
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  labs(title = "Vital status by year of birth",
       x = "year of birth", y = " number of patients") +
  theme_bw() +
  theme(text = element_text(size=16))

# rotate font
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  labs(title = "Vital status by year of birth",
       x = "year of birth", y = " number of patients") +
  theme_bw() +
  theme(axis.text.x = element_text(colour = "grey20", size = 12,
                    angle = 90, hjust = 0.5, vjust = 0.5),
        axis.text.y = element_text(colour = "grey20", size = 12),
        text = element_text(size = 16))

# save theme changes
grey_theme <- theme(axis.text.x = element_text(colour = "grey20", 
                        size = 12,angle = 90, hjust = 0.5, vjust = 0.5),
                    axis.text.y = element_text(colour = "grey20", size = 12),
                    text = element_text(size = 16))

# apply theme changes
ggplot(data=yearly_vital_counts, 
       aes(x=year_of_birth, y=n, color = vital_status)) +
  geom_line() +
  facet_wrap(~ disease) + 
  labs(title = "Vital status by year of birth",
       x = "year of birth", y = " number of patients") +
  theme_bw() +
  grey_theme

#### Arranging and exporting plots ####

install.packages("gridExtra")
library(gridExtra)

cig_boxplot <- ggplot(data=smoke_complete,
      aes(x=vital_status, y=cigarettes_per_day)) +
  geom_boxplot(color="tomato")

birth_count_plot <- ggplot(data=yearly_counts, 
    aes(x=year_of_birth, y=n, 
        group=disease, color = disease)) +
  geom_line()

grid.arrange(cig_boxplot, birth_count_plot, ncol = 2, widths = c(4, 6))

# exporting complex figures
my_plot <- ggplot(data=yearly_counts, 
                  aes(x=year_of_birth, y=n, 
                      group=disease, color = disease)) +
  geom_line()
ggsave("figures/birth_yearly.png", my_plot, width = 15, height = 10)

# This also works for grid.arrange() plots
combo_plot <- grid.arrange(cig_boxplot, birth_count_plot, ncol = 2, widths = c(4, 6))
ggsave("figures/combo_plot.png", combo_plot, width = 10, dpi = 300)
