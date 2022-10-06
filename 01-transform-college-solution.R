# practice transforming data - solutions
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
filter(.data = scorecard, firstgen > .40)


# generate a data frame with the 10 most expensive (netcost) colleges in 2018-19
# hint: use arrange and slice to sort the data from most to least expensive (desc), keep the first 10
arrange(.data = scorecard, desc(netcost)) %>%
  slice(1:10)
# alternative solution using slice_max() function
slice_max(.data = scorecard, order_by = netcost, n = 10)


# generate a data frame with the average SAT score for each type of college
scorecard %>%
  group_by(type) %>%
  summarize(mean_sat = mean(satavg, na.rm = TRUE))


# calculate for each school how many students it takes to pay the average faculty
# member's salary and generate a data frame with the school's name and the calculated value
# use net cost of attendance
scorecard %>%
  mutate(ratio = avgfacsal / netcost) %>%
  select(name, ratio)


# Bonus: calculate how many private, nonprofit schools have a smaller net cost
# than the "University of Chicago": total number of schools and percentage.
# hint: the result should be a data frame with one row for Cornell University,
# and a column containing the requested value.

## code for the number as the total number of schools
scorecard %>%
  filter(type == "Private, nonprofit") %>%
  arrange(netcost) %>%
  # use row_number() but subtract 1 since UChicago is not cheaper than itself
  mutate(school_cheaper = row_number() - 1) %>%
  filter(name == "University of Chicago") %>%
  glimpse()

## code for the number as the percentage of schools
scorecard %>%
  filter(type == "Private, nonprofit") %>%
  mutate(netcost_rank = percent_rank(netcost)) %>%
  filter(name == "University of Chicago") %>%
  glimpse()
