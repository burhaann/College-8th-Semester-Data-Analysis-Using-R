setwd("C:/Users/Administrator/Desktop/R/90")
library(rjson)
StudentDetailsFromJSON <- as.data.frame(fromJSON(file = "MessyData.json"),col.names = c("Roll Number","Name","Email","Number"))
StudentDetailsFromJSON$Marks <- sample(25:100, 31, replace=TRUE)

GenericElective <- c("Electronics","PHP","Carbon Trading","Nursery")
StudentDetailsFromJSON$GE <- sample(GenericElective,replace = TRUE,size = length(StudentDetailsFromJSON$Name))

Favourites <- as.data.frame(table(unlist(StudentDetailsFromJSON$GE)))
colnames(Favourites) <- c("Subjects","Students")

piepercent <- round(100*Favourites$Students/sum(Favourites$Students), digits = 2)
pie(Favourites$Students, labels = paste(piepercent,"%"), main = "Generic Electives Of Batch 2018", col = rainbow(length(Favourites$Subjects)))
legend("topright",border = "brown",legend = Favourites$Subjects, cex = 1.5,
       fill = rainbow(length(Favourites$Subjects)))

barplot(StudentDetailsFromJSON$Marks,xlab = StudentDetailsFromJSON$Name,ylab = StudentDetailsFromJSON$Marks,main = "Results Of Batch 2018",col = rainbow(length(StudentDetailsFromJSON$Name)),border = "white")
legend("bottomright",legend =StudentDetailsFromJSON$Marks , cex = .5, fill = rainbow(length(Favourites$Subjects)))

library(ggplot2)
ggplot(StudentDetailsFromJSON, aes(Name,Marks)) +
  geom_bar(stat = "identity") +
  labs(x= "Students", y = "Marks",title = "Result Of Batch 2018") +
  theme(axis.text.x = element_text(angle = 90, size = 11),
        plot.title = element_text(color="#993333", size=14, face="bold.italic",hjust = .5),
        axis.title.x = element_text(color="blue", size=14, face="bold"),
        axis.title.y = element_text(color="#993333", size=14, face="bold")
        )

par(las = 1)
boxplot(data = StudentDetailsFromJSON,Marks ~ GE, xlab = "Subjects",
        ylab = "Performance Of Students", main = "Performance Range of Students in Generic Elective Subject")

hist(StudentDetailsFromJSON$Marks,xlab = "Marks",ylab = "No. Of Students",col = rainbow(7),border = "white",main = "Histogram Of Student Performance")


plot(x = mtcars$mpg, y=mtcars$hp, type = "o", col = "red", xlab = "Month", ylab = "Rain fall",
     main = "Rain fall chart")
lines(mtcars$mpg, type = "o", col = "blue")

#Using Built in DataSet
plot(x = mtcars$hp,y = mtcars$mpg,
     xlab = "Brake Horse Power - BHP",
     ylab = "Milage Per Gallon",
     xlim = c(0,350),
     main = "HorsePower vs Mileage",
)