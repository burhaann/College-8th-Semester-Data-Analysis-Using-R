install.packages("twitteR") #install package
library(twitteR) #load package

consumer_key <- '2lArnqiiwH5AP72SVbpFEqzeY'
consumer_secret <- 'MpWC8QNKJi5xLm8kGC16kixwyFoeuy7hmg7yzNHxxdK96I1wFO'
access_token <- '1146771854733926407-WbWiTkpO1g2qMfWSoc9LJQlxpgiKuA'
access_secret <- 'EZUKZ8bFt1cOaILqR2z31BilETtLJ2XGP2Byh5ZSTzvVp'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

virus <- searchTwitter('#ftx + #sbf', n = 10, since = '2022-11-01', retryOnRateLimit = 1e3)
virus_df = twListToDF(virus)