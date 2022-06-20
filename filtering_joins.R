source("load_join_data.R")

batmobile <- inventory_parts_joined %>%
  filter(set_num == "7784-1") %>%
  select(-set_num)

batwing <- inventory_parts_joined %>%
  filter(set_num == "70916-1") %>%
  select(-set_num)

batmobile
batwing

batwing %>% 
  semi_join(batmobile, by = "part_num")

batwing%>% 
  anti_join(batmobile, by = "part_num")

colors %>% 
  semi_join(inventory_parts, by = c("id" = "color_id"))

# Use filter() to extract version 1 
version_1_inventories <- inventories %>%
  filter(version == 1)

sets %>% 
  anti_join(version_1_inventories, by = "set_num")
