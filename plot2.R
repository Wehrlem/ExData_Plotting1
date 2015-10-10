#Read the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data February 2007
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Load the data and set the right time
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalpower <- as.numeric(subdata$Global_active_power)

#Define the PNG and plot it
png("plot2.png", width=480, height=480)
plot(datetime, globalpower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()