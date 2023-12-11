#Setting Working Directory
setwd("C:/Users/Administrator/Desktop/R/90")
Batch2018 <- read.csv("Batch2018.csv") #View(Batch2018)

print(is.data.frame(Batch2018))
print(ncol(Batch2018))
print(paste("Total Roll Of Batch 2018 = ",nrow(Batch2018),"students"))

#Writing Emails and Names of Students to a Excel File
library(xlsx)
emailsOfStudents <- data.frame(Batch2018[2:3])
write.xlsx(emailsOfStudents, file="Batch2018.xlsx", sheetName="Student Emails")

#Reading back the Excel File and Adding More Details, Renaming Columns and Removing White Spaces
studentContactDetails <- read.xlsx("Batch2018.xlsx", sheetIndex = 1)
library(rjson)
studentContactDetails <- cbind(studentContactDetails, Batch2018$Phone.Number, Batch2018[1])
colnames(studentContactDetails) <- c("Serial","Name","Email","Number","Roll Number")
studentContactDetails$Name <- trimws(studentContactDetails$Name, which = c("both"))

#Remove the "1821" prefix from the Roll Number Column
studentContactDetails$`Roll Number` <- as.character(studentContactDetails$`Roll Number`)
studentContactDetails$`Roll Number` <- sub(paste0("^[0-9]{",4 , "}"), "", studentContactDetails$`Roll Number`)
studentContactDetails$`Roll Number` <- as.numeric(studentContactDetails$`Roll Number`)

#Rearrange Columns, Split the Data for Better JSON Compatibility
studentContactDetails <- subset(studentContactDetails, select=c(5,2,3,4))
MessyData <- toJSON(unname(studentContactDetails),indent = 1)
write(MessyData, "MessyData.json")
studentContactDetails <- toJSON(unname(split(studentContactDetails, 1:nrow(studentContactDetails))),indent = 1)
write(studentContactDetails, "Batch2018.json")

#Reading JSON Data As A DataFrame and Converting it into XML
StudentDetailsFromJSON <- as.data.frame(fromJSON(file = "MessyData.json"),col.names = c("Roll Number","Name","Email","Number"))
library(xml2)
library(xmlconvert)
StudentDetailsinXMLFormat <- df_to_xml(StudentDetailsFromJSON,)
write_xml(StudentDetailsinXMLFormat, "Batch2018.xml")

