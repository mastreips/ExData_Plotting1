library(tidyr)
library(dplyr)
library(lubridate)


data<-read.table("household_power_consumption.txt", sep=";",header=TRUE, 
                 na.strings=c("NA","-","?"))
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
data2$Date <-dmy(data2$Date)
par(ps=12)
hist(data2$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()