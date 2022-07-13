library(tidyverse)
library(readxl)


comics <- read_csv("data/comics.csv", col_types = list(
  name = "c",
  id = "f",
  align = "f",
  eye = "f",
  gender = "f",
  alive = "f",
  publisher = "f"
))
glimpse(comics)

levels(comics$align)

comics_filtered %>% 
  ggplot(., aes(id, fill=align)) + geom_bar()

ggplot(comics, aes(x = align, fill = gender)) + geom_bar(position = "dodge")

ggplot(comics, aes(x = gender, fill = align)) + geom_bar() + theme(axis.text.x = element_text(angle = 90))

comics_filtered <- comics %>% 
  filter(align != "Reformed Criminals") %>% 
  droplevels()

levels(comics_filtered$align)
