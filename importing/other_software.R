library(haven)


sales <- read_sas("data/sales.sas7bdat")

str(sales)

# haven is already loaded

# Import the data from the URL: sugar
sugar <- read_dta("http://assets.datacamp.com/production/course_1478/datasets/trade.dta")

# Structure of sugar
str(sugar)

# Convert values in Date column to dates
sugar$Date <- as.Date(as_factor(sugar$Date))

# Structure of sugar again
str(sugar)

plot(sugar$Import, sugar$Weight_I)


# haven is already loaded

# Import person.sav: traits
traits <- read_sav("data/person.sav")

# Summarize traits
summary(traits)

# Print out a subset
subset(x = traits, Agreeableness > 40 & Extroversion > 40)




work <- read_sav("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/employee.sav")

summary(work$GENDER)

work$GENDER <- as_factor(work$GENDER)

summary(work$GENDER)

library(foreign)
florida <- read.dta("http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/florida.dta")

tail(florida)

path <- file.path()

