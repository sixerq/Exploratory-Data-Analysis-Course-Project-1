##Getting the dataset
dataset <- "~/Downloads/Coursera/Exploratory Data Analysis - Week 1/Course Project 1/household_power_consumption.txt"
data <- read.table(dataset, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

##Subsetting the data and converting dates
datasubset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Plotting and saving image
plot4A <- as.numeric(datasubset$Global_active_power)
plot4R <- as.numeric(datasubset$Global_reactive_power)
volt <- as.numeric(datasubset$Voltage)
submeter1 <- as.numeric(datasubset$Sub_metering_1)
submeter2 <- as.numeric(datasubset$Sub_metering_2)
submeter3 <- as.numeric(datasubset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, plot4A, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submeter1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, plot4R, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
