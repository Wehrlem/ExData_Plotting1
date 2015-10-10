#Read the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data February 2007
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Load the data, datetime, the submetering, the voltage and the global reactive power
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(subdata$Global_active_power)
submeter1 <- as.numeric(subdata$Sub_metering_1)
submeter2 <- as.numeric(subdata$Sub_metering_2)
submeter3 <- as.numeric(subdata$Sub_metering_3)
globalreactivepower <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)

#Define the PNG
png("plot4.png", width=480, height=480)

#Define the grid
par(mfrow = c(2, 2)) 

#First plot - Global Active Power
plot(datetime, globalpower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Second plot - Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Third plot - Submetering
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Fourth plot - Global Reactive Power
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()