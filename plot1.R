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

#Use dplyr to segment data
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
data2$Date <-dmy(data2$Date)

##Plot the histogram
par(ps=12)
hist(data2$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
     
##save file to png at 480x480 px 
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
