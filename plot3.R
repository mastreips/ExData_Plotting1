##Author: Marcus A. Streips
##Date:  Dec 3, 2014
##
## NOTE:  Please set R working directory to the same directory you have saved this file.  
#
## NOTE:  Please make sure the data set is in the working directory

library(tidyr)
library(dplyr)
library(lubridate)

##Read entire table into memory, designating ? as NA. 
data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, 
                 na.strings=c("NA","-","?"))
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007") #Use dplyr to segment data
data2$Date <-dmy(data2$Date)

##Convert Date to DateTime with paste command, and reformat to POSIXct
data2[,1]<-paste(data2[,1],data2[,2])
data2[,1]<-as.POSIXct(data2$Date, format="%Y-%m-%d %H:%M:%S")

##Plot the graph
par(ps=12)
with(data2,{
  plot(data2$Date, data2$Sub_metering_1,type="l",  xlab="",
       ylab="Energy sub metering")
  lines(data2$Date, data2$Sub_metering_2,type="l", col="red")
  lines(data2$Date, data2$Sub_metering_3,type="l", col="blue")
  legend("topright", lty=c(1,1), col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
})

##save file to png at 480x480 px at res=65 to adjust text size
dev.copy(png, file="plot3.png", width=480, height=480, res=65)
dev.off()
