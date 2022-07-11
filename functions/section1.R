datacamp_lst <- list(
  name = "Datacamp",
  website = "https://www.datacamp.com"
)

datacamp_env <- list2env(datacamp_lst)

parent <- parent.env(datacamp_env)
environmentName(parent)


environmentName(parent.env(parent))


exists("founding_year", envir = datacamp_env, )
founding_year <- 2013

environmentName(founding_year)

