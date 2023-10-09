# PRACTICE TRANSFORMING DATA WITH DPLYR and PIPES
# dplyr documentation https://dplyr.tidyverse.org/reference/index.html


# load required packages (if you are using R locally, install them first)
library(tidyverse)
library(rcis)

# view header of the dataset, look at the variables (and their names)
scorecard
glimpse(scorecard)

# compare head() with glimpse()
head(scorecard)

# view help file for the dataset
?scorecard


# generate a data frame of schools with a greater than
# 40% share of first-generation students
filter(.data = ________, ________)


# generate a data frame with the average SAT score for each type of college
scorecard %>%
  group_by(________) %>%
  summarize(mean_sat = _________(___________))


# generate a data frame with the 10 most expensive (netcost) colleges in 2018-19
# HINT: use arrange(), sort the data from most to least expensive, keep the first 10
arrange(.data = ________, desc(________)) %>%
  ______(________)
# alternative solution using slice_max()
slice_max(.data = ________, order_by = ________, n = ________)


# for each school calculate how many students it takes to pay the average faculty salary
# and generate a data frame with the school's name and the calculated value
# use net cost of attendance
scorecard %>%
  mutate(________ = _______ / _________) %>%
  select(________, ________)

