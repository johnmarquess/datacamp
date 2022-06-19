source("load_join_data.R")

inventory_parts_joined <- inventories %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  arrange(desc(quantity)) %>%
  select(-id, -version)

inventory_parts_joined

inventory_sets_themes <- inventory_parts_joined %>% 
  inner_join(sets,  by = "set_num") %>% 
  inner_join(themes, by = c("theme_id" =  "id")batman %>% count(part_num, color_id, wt = quantity)
star_wars %>% count(part_num, color_id, wt = quantity)
, suffix = c("_set", "_theme"))

inventory_sets_themes

batman <- inventory_sets_themes %>%
  filter(name_theme == "Batman")

star_wars <- inventory_sets_themes %>%
  filter(name_theme == "Star Wars")




