library(tidyr)
library(dplyr)
library(lubridate)


data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, 
                 na.strings=c("NA","-","?"))
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
data2$Date <-dmy(data2$Date)
# data2$Date <-wday(data2$Date, label=TRUE, abbr=TRUE)
# data2$Date <-wday(data2$Time, label=TRUE, abbr=TRUE)
# plot(data2$Date, data2$Global_active_power)

data2[,1]<-paste(data2[,1],data2[,2])
data2[,1]<-as.POSIXct(data2$Date, format="%Y-%m-%d %H:%M:%S")
# plot(data2$Date, data2$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
par(ps=12)
par(mfrow=c(2,2))
plot(data2$Date, data2$Global_active_power,type="l", ylab="Global Active Power", xlab="")
plot(data2$Date, data2$Voltage,type="l", ylab="Voltage", xlab="datetime")
with(data2,{
        plot(data2$Date, data2$Sub_metering_1,type="l",  xlab="",
             ylab="Energy sub metering")
        lines(data2$Date, data2$Sub_metering_2,type="l", col="red")
        lines(data2$Date, data2$Sub_metering_3,type="l", col="blue")
        legend("topright", lty=c(1,1), bty="n",col=c("black", "red", "blue"), 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
})
plot(data2$Date, data2$Global_reactive_power,type="l",ylab="Global_reactive_power",
     xlab="datetime")
dev.copy(png, file="plot4.png", width=480, height=480, res=68)
dev.off()