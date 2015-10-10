#Read the file
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subset the data February 2007
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Load Global_active_power as numeric
globalpower <- as.numeric(subdata$Global_active_power)

#Define the PNG and plot it
png("plot1.png", width=480, height=480)
hist(globalpower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()