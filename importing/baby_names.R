library(tidyverse)
babynames <- readRDS("data/babynames.rds")

glimpse(babynames)


babynames %>%
  # Add columns name_total and name_max for each name
  group_by(name) %>% 
  mutate(name_total = sum(number), name_max = max(number)) %>% 
  ungroup() %>% 
  mutate(fraction_max = number/name_max)


names_normalized <- babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>%
  ungroup() %>%
  mutate(fraction_max = number / name_max)

names_filtered <- names_normalized %>%
  filter(name %in% c("Steven", "Thomas",  "Matthew")) 
  
ggplot(names_filtered, aes(x = year, y = fraction_max, color = name)) + 
  geom_line()




babynames_fraction <- babynames %>% 
  group_by(year) %>% 
  mutate(year_total = sum(number)) %>% 
  ungroup() %>% 
  mutate(fraction = number / year_total)

babynames_fraction %>% 
  filter(name == "Matthew") %>% 
  arrange(year) %>% 
  mutate(difference = fraction - lag(fraction)) %>% 
  arrange(desc(difference))

babynames_fraction %>% 
  arrange(name, year) %>% 
  mutate(difference = fraction - lag(fraction)) %>% 
  group_by(name) %>% 
  arrange(desc(difference))


babynames_fraction %>%
  # Arrange the data in order of name, then year 
  arrange(name, year) %>%
  # Group the data by name
  group_by(name) %>%
  # Add a ratio column that contains the ratio of fraction between each year 
  mutate(ratio = fraction / lag(fraction))



babynames_ratios_filtered <- babynames_fraction %>%
  arrange(name, year) %>%
  group_by(name) %>%
  mutate(ratio = fraction / lag(fraction)) %>%
  filter(fraction >= 0.00001)


babynames_ratios_filtered %>% 
  group_by(name) %>% 
  top_n(1, ratio) %>% 
  arrange(desc(ratio)) %>% 
  filter(fraction >= 0.001)
