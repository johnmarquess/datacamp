library(tidyverse)

sets <- readRDS("data/sets.rds")
themes <- readRDS("data/themes.rds")
parts <- readRDS("data/parts.rds")
part_categories <- readRDS("data/part_categories.rds")
inventories <- readRDS("data/inventories.rds")
inventory_parts <- readRDS("data/inventory_parts.rds")
colors <- readRDS("data/colors.rds")


glimpse(sets)
glimpse(themes)
glimpse(parts)
glimpse(part_categories)
glimpse(inventories)
glimpse(inventory_parts)


sets %>% 
  inner_join(themes, by = c("theme_id" =  "id"),
             suffix = c("_set", "_theme")) %>% 
  count(name_theme, sort=TRUE)


parts %>% 
  inner_join(part_categories, by = c("part_cat_id" ="id"), suffix = c("_part", "_category"))


inventory_parts %>% 
  inner_join(parts, by = "part_num")

# Add an inner join for the colors table
sets %>%
  inner_join(inventories, by = "set_num") %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  inner_join(colors, by = c("color_id" = "id"), suffix = c("_set", "_color")) %>% 
  count(name_color, sort = TRUE)

