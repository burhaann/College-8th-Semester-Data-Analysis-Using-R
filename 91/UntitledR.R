setwd("C:/Users/Administrator/Desktop/R/91")
internetUsers <- read.csv("number-of-internet-users.csv")
colnames(internetUsers)[4] <- "InternetUsers"
internetUsers <- internetUsers[-c(1:1864), ]
data.frame(internetUsers) -> internetUsersOfIndia
internetUsersOfIndia <- head(internetUsersOfIndia,26)
row.names(internetUsersOfIndia) <- NULL
data.frame(internetUsers) -> internetUsersOfPakistan
internetUsersOfPakistan <- internetUsersOfPakistan[-c(1:1210,1233:2672),]
row.names(internetUsersOfPakistan) <- NULL
par(las = 2)
plot(y = internetUsersOfPakistan$InternetUsers,x =internetUsersOfPakistan$Year ,
     xlab = "YEAR",
     ylab = "",
     main = "Internet Users in Pakistan",
)