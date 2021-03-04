library(tidyverse)
countries = read.csv("https://raw.githubusercontent.com/Sociology-FA-CU/appliedregressioninr/main/data/countries.csv")

# zavisi life expectancy na tom, zda je zeme postsovetska??
mod_1 = lm(life_exp ~ postsoviet, data = countries)

summary(mod_1)
