library(data.table);

#data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- read.table("subsetted_dates.txt", sep=";", header=TRUE, 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings="?", stringsAsFactors=FALSE)

#Convert the Date column to dates
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

#Convert the Time column to times
data$Time <- strptime(data$Time, format="%H:%M:%S")

#Plot a histogram of global active power
png(filename="plot1.png")
hist(data$Global_active_power, 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power",
     col="red", breaks=12)
dev.off()