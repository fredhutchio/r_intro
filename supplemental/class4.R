# load library
library(tidyverse)

# read in first filtered data from last class
birth_reduced <- read_csv("data/birth_reduced.csv")
# read in second filtered data from last class
smoke_complete <- read_csv("data/smoke_complete.csv")

# simple plot from base R from the smoke_complete dataset
plot(x=smoke_complete$age_at_diagnosis, y=smoke_complete$cigarettes_per_day)

# basic ggplot
ggplot(data = smoke_complete) # bind data to plot

# basic ggplot
ggplot(data = smoke_complete, aes(x = age_at_diagnosis, 
                           y = cigarettes_per_day)) # specify aesthetics (axes)

ggplot(data = smoke_complete,
       mapping = aes(x = age_at_diagnosis, y = cigarettes_per_day)) + 
  geom_point() # add a layer of geometry

ggplot(smoke_complete) + 
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day)) 

# add transparency with alpha
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day), alpha = 0.1)

# change color of points
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day), 
             alpha = 0.1, color = "green")

# plot disease by color
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, 
                 color = disease), 
             alpha = 0.1)

ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease), alpha = 0.1) +
  theme_bw() # change background theme

ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease), alpha = 0.1) +
  labs(title = "Age at diagnosis vs cigarettes per day", # title
       x="age (days)", # x axis label
       y="cigarettes per day") +# y axis label
  theme_bw()

ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  theme(text = element_text(size = 16)) # increase all font size

ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  theme(axis.text.x = element_text(angle = 90, hjust = 0.5, vjust = 0.5)) # rotate and adjust x axis text

## # create directory for output
## dir.create("figures")
# save plot to file
ggsave("figures/awesomePlot.jpg", width = 10, height = 10, dpi = 300)

# creating a box and whisker plot
ggplot(smoke_complete) +
  geom_boxplot(aes(x = vital_status, y = cigarettes_per_day))

# adding color
ggplot(smoke_complete,
       aes(x = vital_status, y = cigarettes_per_day)) +
  geom_boxplot(aes(x = vital_status, y = cigarettes_per_day), color = "tomato")

# adding colored points to black box and whisker plot
ggplot(smoke_complete) +
  geom_boxplot(aes(x = vital_status, y = cigarettes_per_day)) +
  geom_jitter(aes(x = vital_status, y = cigarettes_per_day), alpha = 0.3, color = "blue")

# boxplot with both boxes and points
ggplot(smoke_complete) +
  geom_boxplot(aes(x = vital_status, y = cigarettes_per_day), outlier.shape = NA) +
  geom_jitter(aes(x = vital_status, y = cigarettes_per_day), alpha = 0.3, color = "blue")

my_plot <- ggplot(smoke_complete, aes(x = vital_status, y = cigarettes_per_day)) 
my_plot +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(alpha = 0.2, color = "purple")

# count number of observations for each disease by year of birth
yearly_counts <- birth_reduced %>%
  count(year_of_birth, disease) 

# plot all counts by year
ggplot(yearly_counts) +
  geom_line(aes(x = year_of_birth, y = n))

# plot one line per cancer type
ggplot(yearly_counts) +
  geom_line(aes(x = year_of_birth, y = n, 
                group = disease))

# color each line per cancer type
ggplot(yearly_counts) +
  geom_line(aes(x = year_of_birth, y = n, color = disease))

# use previous scatterplot, but separate panels by disease
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_wrap(vars(disease)) # wraps panels to make a square/rectangular plot

# add a variable by leaving color but changing panels to other categorical data
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_wrap(vars(tumor_stage))

# scatterplots with panels for vital status in one row
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_grid(rows = vars(vital_status)) 

# add another variable using faceting
ggplot(smoke_complete) +
  geom_point(aes(x = age_at_diagnosis, y = cigarettes_per_day, color = disease)) +
  facet_grid(rows = vars(vital_status), cols = vars(disease)) # arrange plots via variables in rows, columns
