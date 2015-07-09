#Construct the plot1 and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
#Read data from text file
dataFile <- "household_power_consumption.txt"
contentFile <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Subsetting by date
subSetDataByDate <- subset(contentFile, Date == "1/2/2007" | Date == "2/2/2007")

#Making plot1 and save it to PNG file
globalActivePower <- as.numeric(subSetDataByDate$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
