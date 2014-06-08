
## read in the dataset "household_power_consumption.txt"
power <- read.table("household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# subset the data to get the relevant info for the dates in question
relevantdates <- subset(power, (power$Date == "1/2/2007" | power$Date == "2/2/2007"))

#plot1
png("plot1.png", width=480, height=480)
hist(relevantdates$Global_active_power, col='red', xlab="Global Active Power (kilowatts", 
     ylab="Frequency", main= "Global Active Power")