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
filter(.data = scorecard, firstgen > .40)


# generate a data frame with the average SAT score for each type of college
scorecard %>%
  group_by(type) %>%
  summarize(mean_sat = mean(satavg, na.rm = TRUE))


# generate a data frame with the 10 most expensive (netcost) colleges in 2018-19
# HINT: use arrange(), sort the data from most to least expensive, keep the first 10
arrange(.data = scorecard, desc(netcost)) %>%
  head(10)
# alternative solution with slice()
arrange(.data = scorecard, desc(netcost)) %>%
  slice(1:10)
# alternative solution using slice_max()
slice_max(.data = scorecard, order_by = netcost, n = 10)


# for each school calculate how many students it takes to pay the average faculty salary
# and generate a data frame with the school's name and the calculated value
# use net cost of attendance
scorecard %>%
  mutate(ratio = avgfacsal / netcost) %>%
  select(name, ratio)
