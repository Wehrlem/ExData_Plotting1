#Read the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data February 2007
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Load the data, datetime and the submetering
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(subdata$Global_active_power)
submeter1 <- as.numeric(subdata$Sub_metering_1)
submeter2 <- as.numeric(subdata$Sub_metering_2)
submeter3 <- as.numeric(subdata$Sub_metering_3)

#Define the PNG and plot it
png("plot3.png", width=480, height=480)
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()