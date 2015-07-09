#Construct the plot4 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Read data from text file
dataFile <- "household_power_consumption.txt"
contentFile <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting by date
subSetDataByDate <- subset(contentFile, Date == "1/2/2007" | Date == "2/2/2007")

#convert the Date and Time variables to Date/Time classes in R
datetime <- strptime(paste(subSetDataByDate$Date, subSetDataByDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetDataByDate$Global_active_power)
globalReactivePower <- as.numeric(subSetDataByDate$Global_reactive_power)
voltage <- as.numeric(subSetDataByDate$Voltage)
subMetering1 <- as.numeric(subSetDataByDate$Sub_metering_1)
subMetering2 <- as.numeric(subSetDataByDate$Sub_metering_2)
subMetering3 <- as.numeric(subSetDataByDate$Sub_metering_3)

#Making plot3 and save it to PNG file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
