source("load_join_data.R")

parts %>% 
  count(part_cat_id) %>% 
  right_join(part_categories, by = c("part_cat_id" = "id")) %>% 
  replace_na(list(n = 0))


themes %>% 
  inner_join(themes, by = c("parent_id" = "id"), suffix = c("_child", "_parent")) %>% 
  filter(str_detect(name_child, "Rings"))

themes %>% 
  inner_join(themes, by = c("parent_id" = "id"), suffix = c("_child", "_parent")) %>% 
  filter(name_parent == "The Lord of the Rings")

themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>% 
  filter(name_parent == "Harry Potter")

# Join themes to itself again to find the grandchild relationships
themes %>% 
  inner_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  inner_join(themes, by = c("id_child" = "parent_id"), suffix = c("_parent", "_grandchild"))


themes %>% 
  # Left join the themes table to its own children
  left_join(themes, by = c("id" = "parent_id"), suffix = c("_parent", "_child")) %>%
  # Filter for themes that have no child themes
  filter(is.na(id_child)) %>% 
  count(name_parent, sort = TRUE)
