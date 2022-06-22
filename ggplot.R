library(tidyverse)

load("data/diamonds.RData")
load("data/iris.RData")
load("data/fish.RData")
load("data/recess.RData")

library(ggplot2)

str(mtcars)

ggplot(mtcars, aes(x = as_factor(cyl), y = mpg)) + 
  geom_point()
