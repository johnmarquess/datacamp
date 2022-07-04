library(jsonlite)

fromJSON("http://www.omdbapi.com/?i=tt0095953&plot=full&r=json&apikey=399cc529")


# The package jsonlite is already loaded
# The package jsonlite is already loaded

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=72bc447a&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=72bc447a&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

sw4$Title
sw3$Title

sw4$Year > sw3$Year

# Definition of the URLs
url_sw4 <- "http://www.omdbapi.com/?apikey=72bc447a&i=tt0076759&r=json"
url_sw3 <- "http://www.omdbapi.com/?apikey=72bc447a&i=tt0121766&r=json"

# Import two URLs with fromJSON(): sw4 and sw3
sw4 <- fromJSON(url_sw4)
sw3 <- fromJSON(url_sw3)

sw4$Title
sw3$Title

sw4$Year > sw3$Year




# Challenge 1
json1 <- '[1, 2,3, 4, 5,6]'
fromJSON(json1)

# Challenge 2
json2 <- '{"a": [1, 2, 3], "b": [4,5,6]}'
fromJSON(json2)


# jsonlite is already loaded

# Challenge 1
json1 <- '[[1, 2], [3, 4], [5, 6]]'
fromJSON(json1)[1:2,]

# Challenge 2
json2 <- '[{"a": 1, "b": 2}, {"a": 3, "b": 4}, {"a": 5, "b": 6}]'
fromJSON(json2)


# jsonlite is already loaded

# URL pointing to the .csv file
url_csv <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1478/datasets/water.csv"

# Import the .csv file located at url_csv
water <- read.csv(url_csv)

# Convert the data file according to the requirements
water_json <- toJSON(water)

# Print out 
water_json


pretty_json <- toJSON(mtcars, pretty = TRUE)
pretty_json

mini_json <- toJSON(mtcars)
mini_json
