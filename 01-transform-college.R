# practice transforming data
# check the dplyr documentation https://dplyr.tidyverse.org/reference/index.html


# load required packages
library(tidyverse)
library(rcis)

# view header of the dataset
scorecard
glimpse(scorecard)

# view help file for the dataset
?scorecard


# generate a data frame of schools with a greater than
# 40% share of first-generation students
filter(.data = ________, ________)


# generate a data frame with the 10 most expensive (netcost) colleges in 2018-19
# hint: use arrange and slice to sort the data from most to least expensive (desc), keep the first 10
arrange(.data = ________, ________) %>%
  slice(________)
# alternative solution using slice_max() function
slice_max(.data = ________, order_by = ________, n = ________)


# generate a data frame with the average SAT score for each type of college
scorecard %>%
  group_by(________) %>%
  summarize(mean_sat = ______________________)


# calculate for each school how many students it takes to pay the average faculty
# member's salary and generate a data frame with the school's name and the calculated value
# use net cost of attendance
scorecard %>%
  mutate(________ = _______ / _________) %>%
  select(________, ________)


# Bonus: calculate how many private, nonprofit schools have a smaller net cost
# than the "University of Chicago": total number of schools and percentage.
# hint: the result should be a data frame with one row for the "University of Chicago",
# and a column containing the requested value.

## code for the number as the total number of schools

## code for the number as the percentage of schools
