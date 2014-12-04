library(tidyr)
library(dplyr)
library(lubridate)


data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, 
                 na.strings=c("NA","-","?"))
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
data2$Date <-dmy(data2$Date)


data2[,1]<-paste(data2[,1],data2[,2])
data2[,1]<-as.POSIXct(data2$Date, format="%Y-%m-%d %H:%M:%S")

par(ps=12)
with(data2,{
  plot(data2$Date, data2$Sub_metering_1,type="l",  xlab="",
       ylab="Energy sub metering")
  lines(data2$Date, data2$Sub_metering_2,type="l", col="red")
  lines(data2$Date, data2$Sub_metering_3,type="l", col="blue")
  legend("topright", lty=c(1,1), col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
})


dev.copy(png, file="plot3.png", width=480, height=480, res=65)
dev.off()
