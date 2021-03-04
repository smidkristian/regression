
library(tidyverse)

# simulation example

x = 1:20
n = length(x)
a = 0.2
b = 0.3

sigma = 0.5 # zmensujeme chybu

set.seed(42) # tim zajistime stejne "random" hodnoty

y = a + b * x + sigma * rnorm(n)

# sigma * rnorm(n) - je chyba, ktera je v kazdem modelu

fake = data.frame(x, y)

lm(y ~ x, data = fake)

fit_1 = lm(y ~ x, data = fake)

summary(fit_1)

ggplot(aes(x = x, y = y), data = fake) + 
  geom_point() +
  geom_smooth(method = "lm", se = F)

plot(y ~ x, data = fake)
abline(fit_1)

fit_1$model[[1]] - fit_1$fitted.values
fit_1$residuals

# countries

countries = read.csv("https://raw.githubusercontent.com/Sociology-FA-CU/appliedregressioninr/main/data/countries.csv") 

countries %>% glimpse()
ggplot(aes(x = dem_index, y = life_exp), data = countries) +
  geom_point() +
  geom_smooth(method = "lm", se = F)

fit_2 = lm(life_exp ~ dem_index, data = countries)
summary(fit_2)

# centring

countries = countries %>% 
  mutate(dem_index_c = dem_index - mean(dem_index, na.rm = T))

fit_3 = lm(life_exp ~ dem_index_c, data = countries)
summary(fit_3) # centrovanim jsme ziskali interpretovatelny intercept
