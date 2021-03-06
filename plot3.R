#Construct the plot3 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Read data from text file
dataFile <- "household_power_consumption.txt"
contentFile <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting by date
subSetDataByDate <- subset(contentFile, Date == "1/2/2007" | Date == "2/2/2007")

#convert the Date and Time variables to Date/Time classes in R
datetime <- strptime(paste(subSetDataByDate$Date, subSetDataByDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetDataByDate$Global_active_power)
subMetering1 <- as.numeric(subSetDataByDate$Sub_metering_1)
subMetering2 <- as.numeric(subSetDataByDate$Sub_metering_2)
subMetering3 <- as.numeric(subSetDataByDate$Sub_metering_3)

#Making plot3 and save it to PNG file
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

