#Read the data 
fulldata<-read.csv("C:/Shankar/Courses/Coursera/Data Science R Programming (JHU)/4. Exploratory Data Analysis/household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",colClasses = c(rep("character",2),rep("numeric",7)))

#To get the data of specific dates(1/2/2007 and 2/2/2007)
data<-subset(fulldata,Date %in% c("1/2/2007","2/2/2007"))

#Making a POSIXct date 
data$Date<-as.Date(data$Date,"%d/%m/%Y")
datetime<-as.POSIXct(paste(data$Date,data$Time))

#Creating png
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#Creating plot
with(data,{
        plot(datetime,Global_active_power,xlab = "",ylab = "Global Active Power",type="l")
        plot(datetime,Voltage,xlab = "datetime",ylab="Voltage",type="l")
        plot(datetime,Sub_metering_1,col="black",type = "l",xlab="",ylab="Energy sub metering")
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2)
        plot(datetime,Global_reactive_power,type="l")
})
dev.off()