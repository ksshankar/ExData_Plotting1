#Read the data 
fulldata<-read.csv("C:/Shankar/Courses/Coursera/Data Science R Programming (JHU)/4. Exploratory Data Analysis/household_power_consumption.txt",header=TRUE,na.strings = "?",sep=";",colClasses = c(rep("character",2),rep("numeric",7)))

#To get the data of specific dates(1/2/2007 and 2/2/2007)
data<-subset(fulldata,Date%in%c("1/2/2007","2/2/2007"))

#Creating png file
png("plot1.png",width=480,height=480)

#Creating Plot
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()