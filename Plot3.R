## read in the dataset "household_power_consumption.txt"
power <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# subset the data to get the relevant info for the dates in question
relevantdates <- subset(power, (power$Date == "1/2/2007" | power$Date == "2/2/2007"))

# Change date class from character to Date: 
relevantdates$Date <- as.Date(relevantdates$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
relevantdates$DateTime <- as.POSIXct(paste(relevantdates$Date, relevantdates$Time))

# Plot3:
png("plot3.png", width=480, height= 480)
plot(relevantdates$DateTime, relevantdates$Sub_metering_1, type= "l",
     ylab= "Energy sub metering", xlab="")
lines(relevantdates$DateTime, relevantdates$Sub_metering_2, type="l", col="red")
lines(relevantdates$DateTime, relevantdates$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
