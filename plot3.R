#Plot 1 - Programming Assignment 1
setwd("C:/Users/crehwinkel/My Documents/DataScience/ExploreData/ProgramAssign1")

newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)

library(dplyr)
newFile$DateTime <- paste(newFile$Date, " ", newFile$Time)
newFile$DateTime <- as.Date(newFile$DateTime, format = "%d/%m/%Y %H:%M:%S")

subs <- filter(newFile, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

subs1 <- mutate(subs, CombDT = paste(subs$Date, " ", subs$Time))
subs1$CombDT <- as.POSIXlt(subs1$CombDT, format = "%d/%m/%Y %H:%M:%S")


plot(subs1$CombDT , subs1$Sub_metering_1, ylim = range(0:40),
     ylab = "Energy sub metering", xlab = "", type = "l")
points(subs1$CombDT,subs1$Sub_metering_2, col = "red", type = "l" )
points(subs1$CombDT,subs1$Sub_metering_3, col = "blue", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), 
       lwd= c(2, 2, 2), col = c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()