library(tidyverse)

load("data/diamonds.RData")
load("data/iris.RData")
load("data/fish.RData")
load("data/recess.RData")

library(ggplot2)

str(mtcars)

ggplot(mtcars, aes(x = as_factor(cyl), y = mpg)) + 
  geom_point()

str(mtcars)

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = FALSE) +
  stat_smooth(aes(group="A"), method="lm", se=FALSE)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  # Add 3 smooth LOESS stats, varying span & color
  stat_smooth(method = "lm", se=FALSE, span = 0.9 , color = "red") +
  stat_smooth(method = "lm", se=FALSE, span = 0.6 , color = "green") +
  stat_smooth(method = "lm", se=FALSE, span = 0.6 , color = "blue") 



# Amend the plot
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point() +
  # Map color to dummy variable "All"
  stat_smooth(aes(group="All"),  se = FALSE) +
  stat_smooth(aes(group="All"),  method = "lm", se = FALSE)

