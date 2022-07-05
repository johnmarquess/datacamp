library(tidyverse)
library(reclin)


zagat <- readRDS("data/zagat.rds")
fodors <- readRDS("data/fodors.rds")

glimpse(zagat)
glimpse(fodors)

pair_blocking(zagat, fodors, "city") %>%
  compare_pairs(by = c("name", "addr"), default_comparator = jaro_winkler(0.9)) %>% 
  score_problink() %>% 
  select_n_to_m() %>% 
  link() %>% 
  as.tibble() %>% 
  arrange(name.y) %>% 
  View()
  
