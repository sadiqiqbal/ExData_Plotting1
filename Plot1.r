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
SubsetData<- subset(GivenData, (GivenData$Date == "1/2/2007" | GivenData$Date== "2/2/2007"))

## Since the extracted data is now available, we can delete the entire data set to free the memory
rm(GivenData)

## Plot the histogram 
hist(SubsetData$Global_active_power, main="Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", col="Red")

## Save the figure of frequency vs global active power as a png file
dev.copy(png, file="Plot1.png", height=480, width=480)
dev.off() 