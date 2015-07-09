#Construct the plot2 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Read data from text file
dataFile <- "household_power_consumption.txt"
contentFile <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting by date
subSetDataByDate <- subset(contentFile, Date == "1/2/2007" | Date == "2/2/2007")

#Making plot2 and save it to PNG file
datetime <- strptime(paste(subSetDataByDate$Date, subSetDataByDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetDataByDate$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
