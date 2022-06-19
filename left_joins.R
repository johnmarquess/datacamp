source("load_join_data.R")

inventory_parts_joined <- inventories %>% 
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>% 
  select(-id, -version) %>% 
  arrange(desc(quantity))

batmobile <- inventory_parts_joined %>% 
  filter(set_num == "7784-1") %>% 
  select(-set_num)

batwing <- inventory_parts_joined %>% 
  filter(set_num == "70916-1") %>% 
  select(-set_num)
