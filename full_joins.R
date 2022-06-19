source("load_join_data.R")

batman_parts <- batman %>%
  count(part_num, color_id, wt = quantity)

star_wars_parts <- star_wars %>%
  count(part_num, color_id, wt = quantity)

batman_parts
star_wars_parts



batman_parts %>% 
  full_join(star_wars_parts, by = c("part_num", "color_id"), suffix = c("_batman", "_star_wars")) %>% 
  replace_na(list(n_batman = 0,
                  n_star_wars = 0))
