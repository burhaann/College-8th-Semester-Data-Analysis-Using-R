library(rtweet)

Sys.setenv(BEARER_TOKEN = "AAAAAAAAAAAAAAAAAAAAAPfSjwEAAAAAOrWJfVbb0%2FHFzwYuTSrizhDHw08%3DCTrB1bb5N7m64iuGZu50QM28lLYwwdHecZe65b2pA1vXXRJgA9")

app = "RProgrammingBurhaan"
api_key = "2lArnqiiwH5AP72SVbpFEqzeY"
api_secret = "MpWC8QNKJi5xLm8kGC16kixwyFoeuy7hmg7yzNHxxdK96I1wFO"
access_token = "1146771854733926407-WbWiTkpO1g2qMfWSoc9LJQlxpgiKuA"
access_secret = "EZUKZ8bFt1cOaILqR2z31BilETtLJ2XGP2Byh5ZSTzvVp"

auth_setup_default()

elon <- search_tweets2('@elonmusk', n = 50)
elonTweets <- as.character(elon$full_text)

# spc <- search_tweets('#spcollege', n = 10, since = '2022-11-01', retryOnRateLimit = 1e3)


#analying mood of the person
library (syuzhet)
elonMood <- get_nrc_sentiment(elonTweets)
elonFeelings <- as.data.frame(cbind(elon$full_text,elonMood))
barplot(colSums(elonMood), col = rainbow(5),ylab="Based on how many tweets" ,main ="Analysing Feelings Of Elon Musk (Using Twitter Api)")

