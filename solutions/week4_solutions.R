#### Intro to R: week 4 exercises ####

# Data visualization with ggplot2

# Objectives:
#   creating and modifying scatterplots and boxplots
#   representing time series data as line plots
#   splitting into multiple panels
#   customizing plots

#### In-class exercises ####

#
yearly_vital_birth <- birth_reduced %>%
  group_by(year_of_birth, vital_status, disease) %>%
  summarize(avg_age = mean(age_at_diagnosis))
ggplot(data = yearly_vital_birth,
       aes(x = year_of_birth, y = avg_age, color = disease)) +
  geom_line() +
  facet_grid(vital_status ~ .)

#### Extra exercises ####
