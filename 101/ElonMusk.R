install.packages("httr")
install.packages("jsonlite")
install.packages("dplyr")



require(httr)
require(jsonlite)
require(dplyr)


#Making request to twitters API

bearer_token <- Sys.getenv("AAAAAAAAAAAAAAAAAAAAAPfSjwEAAAAAOrWJfVbb0%2FHFzwYuTSrizhDHw08%3DCTrB1bb5N7m64iuGZu50QM28lLYwwdHecZe65b2pA1vXXRJgA9")
headers <- c(`Authorization` = sprintf('Bearer %s', bearer_token))

params <- list(`user.fields` = 'description',
               `expansions` = 'pinned_tweet_id')

handle <- readline('elonmusk')
url_handle <-
  sprintf('https://api.twitter.com/2/users/by?usernames=%s', handle)

response <-
  httr::GET(url = url_handle,
            httr::add_headers(.headers = headers),
            query = params)
obj <- httr::content(response, as = "text")
print(obj)

#Working with our JSON payload
json_data <- fromJSON(obj, flatten = TRUE) %>% as.data.frame
View(json_data)

final <-
  sprintf(
    "Handle: %s\nBio: %s\nPinned Tweet: %s",
    json_data$data.username,
    json_data$data.description,
    json_data$includes.tweets.text
  )

cat(final)