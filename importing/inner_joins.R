source("load_join_data.R")


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

