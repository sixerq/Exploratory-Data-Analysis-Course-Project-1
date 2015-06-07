##Getting the dataset
dataset <- "~/Downloads/Coursera/Exploratory Data Analysis - Week 1/Course Project 1/household_power_consumption.txt"
data <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the data and converting dates
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot 1
plot1 <- as.numeric(datasubset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()