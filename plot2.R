##Getting the dataset
dataset <- "~/Downloads/Coursera/Exploratory Data Analysis - Week 1/Course Project 1/household_power_consumption.txt"
data <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the data and converting dates
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plotting and saving image
plot2 <- as.numeric(datasubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, plot2, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()