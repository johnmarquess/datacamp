library(tidyverse)
library(lubridate)

questions <- readRDS("data/questions.rds")
question_tags <- readRDS("data/question_tags.rds")
answers <- readRDS("data/answers.rds")
tags <- readRDS("data/tags.rds")

questions_with_tags <- questions %>% 
  left_join(question_tags, by = c("id" = "question_id")) %>% 
  left_join(tags, by = c("tag_id" = "id")) %>% 
  replace_na(list(tag_name = "only-r"))


questions_with_tags %>% 
  # Group by tag_name
  group_by(tag_name) %>%
  # Get mean score and num_questions
  summarize(score = mean(score),
            num_questions = n()) %>%
  # Sort num_questions in descending order
  arrange(desc(num_questions))

question_tags
tags


tags %>% 
  anti_join(question_tags, by = c( "id" = "tag_id" ))



questions %>%
  # Inner join questions and answers with proper suffixes
  inner_join(answers, by = c("id" = "question_id"), suffix = c("_question", "_answer")) %>%
  # Subtract creation_date_question from creation_date_answer to create gap
  mutate(gap = as.integer(creation_date_answer - creation_date_question))



answer_counts <- answers %>%
  count(question_id, sort = TRUE)

question_answer_counts <- questions %>%
  left_join(answer_counts, by = c("id" = "question_id")) %>%
  replace_na(list(n = 0))

question_answer_counts %>% 
  inner_join(question_tags, by = c("id" = "question_id")) %>% 
  inner_join(tags, by = c("tag_id" = "id"))


tagged_answers <- question_answer_counts %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))


tagged_answers %>% 
  group_by(tag_name) %>% 
  summarise(questions = n(), average_answers = mean(n)) %>% 
  arrange(desc(questions))


questions %>% 
  inner_join(question_tags, by = c("id" = "question_id")) %>% 
  inner_join(tags, by = c("tag_id" = "id"))


answers %>% 
  inner_join(question_tags, by = "question_id") %>% 
  inner_join(tags, by = c("tag_id" = "id"))

questions_with_tags <- questions %>%
  inner_join(question_tags, by = c("id" = "question_id")) %>%
  inner_join(tags, by = c("tag_id" = "id"))

answers_with_tags <- answers %>%
  inner_join(question_tags, by = "question_id") %>%
  inner_join(tags, by = c("tag_id" = "id"))


posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                             answers_with_tags %>% mutate(type = "answer"))

posts_with_tags %>% mutate(year = year(creation_date)) %>% 
  count(type, year, tag_name)

by_type_year_tag <- posts_with_tags %>%
  mutate(year = year(creation_date)) %>%
  count(type, year, tag_name)


by_type_year_tag_filtered <- by_type_year_tag %>%
  filter(tag_name %in% c("dplyr", "ggplot2"))

# Create a line plot faceted by the tag name 
ggplot(by_type_year_tag_filtered, aes(x=year, y=n, color = type)) +
  geom_line() +
  facet_wrap(~ tag_name)

