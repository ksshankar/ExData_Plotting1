#Read the data 
fulldata<-read.csv("C:/Shankar/Courses/Coursera/Data Science R Programming (JHU)/4. Exploratory Data Analysis/household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",colClasses = c(rep("character",2),rep("numeric",7)))

#To get the data of specific dates(1/2/2007 and 2/2/2007)
data<-subset(fulldata,Date %in% c("1/2/2007","2/2/2007"))

#Making a POSIXct date 
data$Date<-as.Date(data$Date,"%d/%m/%Y")
datetime<-paste(data$Date,data$Time)
datetime<-as.POSIXct(datetime)

#Creating png
png("plot2.png",width=480,height=480)

#Creating plot
with(data,plot(datetime,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab="",type="l"))
dev.off()