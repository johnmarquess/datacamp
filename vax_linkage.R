library(tidyverse)
library(lubridate)
library(reclin)
library(readxl)

over_50 <- read_xlsx("data/vax_over_50/2022 QLD FluVaccine 50-59 09062022.xlsx") %>% select(1:17)
over_60 <- read_xlsx("data/vax_over_50/2022 QLD FluVaccine 50-59 09062022.xlsx",) %>% select(1:17)
over_70 <- read_xlsx("data/vax_over_50/2022 QLD FluVaccine 50-59 09062022.xlsx") %>% select(1:17)
over_80 <- read_xlsx("data/vax_over_50/2022 QLD FluVaccine 50-59 09062022.xlsx") %>% select(1:17)

vax_names <- c("firstName", "surname", "medicare", "medicareIssuerNum", "medicareRefNum", "PIN",
           "sex", "indigenous", "ageGroup", "dob", "state", "postcode", "doseNum", "year",
           "date", "vaccineBrand", "providerType", "providerID")

all_ages_vax <- bind_rows(over_50, over_60, over_70, over_80)
colnames(all_ages_vax) <- vax_names
glimpse(all_ages_vax)

rm(over_50, over_60, over_70, over_80)

all_ages_vax <- all_ages_vax %>% mutate(postcode = as.integer(postcode))


racf_names <- c("id", "firstName", "middleName", "surname", "dob", "sex", "indigenous",
                "admission", "serviceID","serviceName", "address1", "address2", "suburb", "state", "postcode")

racf <- read_csv("data/vax_over_50/Residential Care clients Qld 30 Jun 2022.csv", skip=1, col_names = racf_names)
racf <- racf %>% mutate(dob = dmy(dob), postcode = as.integer(postcode))
glimpse(racf)








glimpse(all_ages_vax)
glimpse(racf)


linked_data <- pair_blocking(racf, all_ages_vax, blocking_var = c("state", "postcode")) %>% 
  compare_pairs(by = c("firstName", "surname", "dob"), default_comparator = jaro_winkler(0.9)) %>% 
  score_problink(var = "weight") %>% 
  select_n_to_m(threshold = 0.9) %>% 
  link()
