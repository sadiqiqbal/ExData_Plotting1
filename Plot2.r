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

## Convert the date format
SubsetData$Date <- as.Date(SubsetData$Date, format = "%d/%m/%Y")
SubsetData$DateTime <- as.POSIXct(paste(SubsetData$Date, SubsetData$Time))

## Next plot the Global active power vs days plot and save it as a png file
plot(SubsetData$DateTime, SubsetData$Global_active_power, type="l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

## Save the figure as a png file
dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off() 