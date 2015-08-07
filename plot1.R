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


hist(subs$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylim = range(0:1200))
dev.copy(png, file = "plot1.png")
dev.off()