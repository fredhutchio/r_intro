#### Intro to R: class 4 exercises ####

# Data visualization with ggplot2

# Objectives:
#   creating and modifying scatterplots and boxplots
#   representing time series data as line plots
#   splitting into multiple panels
#   customizing plots

#### In-class exercises ####

## Challenge: create a scatterplot showing age at diagnosis vs years smoked with points colored by gender
ggplot(data=smoke_complete,
       aes(x=age_at_diagnosis, 
           y=years_smoked, color=gender)) +
  geom_point()

## Challenge: does the order of geom layers matter? Yes!
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_jitter(alpha=0.3, color="tomato") +
  geom_boxplot()
## Challenge: visualize the same data as a violin plot in a color of your choice
ggplot(data=smoke_complete,
       aes(x=vital_status, y=cigarettes_per_day)) +
  geom_violin(color="tomato")

## Challenge: create a plot of birth year and number of patients with two lines representing the number of patients of each gender 
yearly_counts2 <- birth_reduced %>%
  count(year_of_birth, gender)
ggplot(data=yearly_counts2, 
       aes(x=year_of_birth, y=n, color=gender)) +
  geom_line(aes(color=gender))
# how could you change the line appearance besides changing color? dashes, dots, etc
ggplot(data=yearly_counts2, 
       aes(x=year_of_birth, y=n, color=gender)) +
  geom_line(aes(linetype=gender))

## Challenge: alter your last challenge plot of (birth year by number of patients) to show each gender in separate panels
ggplot(data=yearly_counts2, 
       aes(x=year_of_birth, y=n, color=gender)) +
  geom_line() +
  facet_wrap(~gender)

## Challenge: find way to change axes, like tick marks, labels, lines, etc (Google search!)
# http://www.sthda.com/english/wiki/ggplot2-axis-ticks-a-guide-to-customize-tick-marks-and-labels#set-the-position-of-tick-marks
ggplot(data=yearly_counts2, 
       aes(x=year_of_birth, y=n, color=gender)) +
  geom_line() +
  theme(axis.text.x = element_blank(), # hide labels
    axis.text.y = element_blank()) +
  facet_wrap(~gender)

## Challenge: improve one of the plots previously created today, by changing thickness of lines, name of legend, or color palette (http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/)

#### Extra exercises ####
