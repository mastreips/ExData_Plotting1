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
par(ps=12)
plot(data2$Date, data2$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()