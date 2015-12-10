## This assignment uses data from the UC Irvine Machine Learning Repository

## Clear the memory first
rm(list=ls(all=TRUE)) 

## Download the data from the website inside a folder and Set the path to the folder
setwd("~/Coursera/Exploratory_Data_Analysis/exdata_data_household_power_consumption")

## read the data from the household_power_consumption.txt file
## The command read.table reads a file in table format and creates a data frame from it, 
## with cases corresponding to lines and variables to fields in the file. 
GivenData <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

## Extracting the data related to the 2 given dates (extract the subset from the entire data set)
SubsetData <- subset(GivenData, (GivenData$Date == "1/2/2007" | GivenData$Date== "2/2/2007"))

## Since the extracted data is now available, we can delete the entire data set to free the memory
rm(GivenData)

## Convert the date format
SubsetData$Date <- as.Date(SubsetData$Date, format = "%d/%m/%Y")
SubsetData$DateTime <- as.POSIXct(paste(SubsetData$Date, SubsetData$Time))

## Next plot the four windows in a cyclic order
par(mfrow = c(2, 2)) 
plot(SubsetData$DateTime, SubsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2) 
plot(SubsetData$DateTime, SubsetData$Voltage, type="l", xlab="datetime", ylab="Voltage") 
plot(SubsetData$DateTime, SubsetData$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(SubsetData$DateTime, SubsetData$Sub_metering_2, type="l", col="red") 
lines(SubsetData$DateTime, SubsetData$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(SubsetData$DateTime, SubsetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Finally, save the figure as a png file
dev.copy(png, file="Plot4.png", height=480, width=480)
dev.off() 