#### Intro to R: data visualization with ggplot2 ####

# install package
#install.packages("tidyverse") # watch for popup on lab computers to complete install
# load library/package
library(tidyverse) # needs to happen every time R restarts
# check dplyr installation
?select
# check ggplot2 installation
?ggplot

# reading in data and saving to object
surveys <- read.csv("data/portal_data_joined.csv")
# recall object
surveys

# stupid plot
plot(x=surveys_complete$weight, y=surveys_complete$hindfoot_length)

# create a simple ggplot
ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) +
  geom_point()

# add transparency
ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha=0.1)

# add color
ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha=0.1, color="green")

# change background
ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha=0.1, color="green") +
  theme_bw()

# change background
ggplot(data = surveys_complete, 
       aes(x = weight, y = hindfoot_length)) +
  geom_point(alpha=0.1, color="green") +
  labs(title = "Weight vs HF",
       x="weight (g)",
       y="hindfoot length (mm)") +
  theme_bw()

# save plot to file
ggsave("figures/awesomePlot.jpg")

# creating a box and whisker plot
ggplot(data=surveys_complete,
       aes(x=species_id, y=weight)) +
  geom_boxplot(color="tomato")

# plotting data in a time series

## count number of observations for each species by year
yearly_counts <- surveys_complete %>%
  group_by(year, species_id) %>%
  tally()
# plot all species by year
ggplot(data=yearly_counts, 
       aes(x=year, y=n, 
           group=species_id, color=species_id)) +
  geom_line()









