## read in the dataset "household_power_consumption.txt"
power <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# subset the data to get the relevant info for the dates in question
relevantdates <- subset(power, (power$Date == "1/2/2007" | power$Date == "2/2/2007"))

# Change date class from character to Date: 
relevantdates$Date <- as.Date(relevantdates$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
relevantdates$DateTime <- as.POSIXct(paste(relevantdates$Date, relevantdates$Time))

##Plot 4

# Creating Plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2)) # adding plots.
##plot 1 in grid
plot(relevantdates$DateTime, relevantdates$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")

##plot 2 in grid
plot(relevantdates$DateTime, relevantdates$Sub_metering_1, type="l", 
     ylab= "Energy sub metering", xlab="")
lines(relevantdates$DateTime, relevantdates$Sub_metering_2, type="l", col="red")
lines(relevantdates$DateTime, relevantdates$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, bty="n", col=c("black", "red", "blue")) 

##plot 3 in grid
plot(relevantdates$DateTime, relevantdates$Voltage, type="l", xlab="datetime", ylab="Voltage") 

##plot 4 in grid
plot(relevantdates$DateTime, relevantdates$Global_reactive_power, type="l", xlab="datetime", 
     ylab="Global_reactive_power")
dev.off()