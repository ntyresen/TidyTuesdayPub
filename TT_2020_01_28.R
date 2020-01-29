# Tidy Tuesday 2020-01-28
# San Francisco Trees

require(tidyverse)
require(lubridate)
options(stringsAsFactors = FALSE)
setwd("D:/OfflWork_DATA/TidyTuesday")
# dir.create("Figures")
imageDir <- file.path("Figures")

# Get data
# sf_trees <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-28/sf_trees.csv')
sf_trees <- read.csv("TT_2020_01_28_sf_trees.csv")

# Look at data
str(sf_trees)
head(sf_trees)
summary(sf_trees)
str(as.factor(sf_trees$tree_id)) # ids are unique, assume each line is a unique tree

# Make "year" column using lubridate
# lubridate::ymd() parses character "YEAR-MONTH-DAY"
# year() writes year out of the parsed data

sf_trees$year <- year(ymd(sf_trees$date))

# Histogram of years

ggplot(data = sf_trees) +
  geom_histogram(mapping = aes(x = year), bins = 25) +
  scale_x_continuous(limits = c(1972, 2019)) +
  labs(title = "Trees in San Francisco", y = NULL, x = "Planting year")
imageFile <- file.path(imageDir, "TT_2020_01_28_sf_trees_01.tiff")
ggsave(imageFile); invisible(dev.off())
  