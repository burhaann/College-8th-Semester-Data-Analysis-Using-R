library(rvest)
library(tidyverse)

#URL
url = "https://www.amazon.in/s?i=computers&bbn=1375424031&rh=n%3A1375424031%2Cp_n_feature_seven_browse-bin%3A16757441031&s=price-asc-rank&dc&ds=v1%3AEejBVUMrzcMQbB8pLQdm2mF9coyNVGnr35lpdJ4QjHg&qid=1671530787&rnid=7005020031&ref=sr_st_price-asc-rank"

#convert url to html object
document <- read_html(url)

# information
info <- document %>%
  html_elements (xpath = "//*[@class='a-size-base-plus a-color-base a-text-normal']") %>%
    html_text()
price <- document %>%
  html_elements (xpath = "//*[@class='a-price-whole']") %>%
  html_text()
info<- head(info,length(price))

price <- as.numeric(gsub(",","", price))
laptops <- data.frame(info,price)

# barplot(price,names.arg = info,xlab="Month",ylab="Revenue",col="blue",
#         main="Revenue chart",border="red",height = .5)
