library(plotrix)

start = 1
end = 1000

x <- c(start:end)
limits <- c(start-1,end+1)
colo <- color.gradient(c(0,1,0),c(1,0,1),c(0,1,0),nslices = 1000)

plot(x,
     main="Cross Pattern",
     col = colo,
     xlab="X Axis",
     ylab="Y Axis",
     xlim = limits,
     ylim = limits,
     )
points(rev(x), col = colo)

# legend(x = "topright", box.col = "black",
#        bg ="white", box.lwd = 1, title="Cross",
#        legend=c("X Blue", "Y Red"),
#        fill = c("blue","red"))