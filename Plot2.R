
## read in the dataset "household_power_consumption.txt"
power <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# subset the data to get the relevant info for the dates in question
relevantdates <- subset(power, (power$Date == "1/2/2007" | power$Date == "2/2/2007"))

# Change date class from character to Date: 
relevantdates$Date <- as.Date(relevantdates$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
relevantdates$DateTime <- as.POSIXct(paste(relevantdates$Date, relevantdates$Time))

# Creating Plot2:
png("plot2.png", width=480, height= 480)
plot(relevantdates$DateTime, relevantdates$Global_active_power, type= "l", lwd=1, 
     ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()