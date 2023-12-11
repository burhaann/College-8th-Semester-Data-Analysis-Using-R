setwd("C:/Users/Administrator/Desktop/R/91")
internetUsers <- read.csv("internet_users.csv")
internetUsers = subset(internetUsers, select = -c(Region,Population,X..of.Population))
internetUsers <- internetUsers[-c(1), ]
internetUsers <-internetUsers[order(internetUsers$Internet.Users, decreasing = TRUE), ]  
row.names(internetUsers) <- NULL
internetUsers <- head(internetUsers,23)
rbind(internetUsers,data.frame(Country="Other Countries",Internet.Users=800000000))



library(plotrix)
par(oma=c(0, 0, 0, 10))
piepercent <- round(100*internetUsers$Internet.Users/sum(internetUsers$Internet.Users), digits = 2)
pie3D(internetUsers$Internet.Users,shade = .35, labels=paste(piepercent,"%"), explode=0.25, height=0.25,radius = 1.5, main='Internet Users By Country', col=rainbow(length(internetUsers$Country)))
legend(-.5,1.05, border = "brown",legend = internetUsers$Country, cex = .75,
       fill = rainbow(length(internetUsers$Country)),ncol =  1,
       )