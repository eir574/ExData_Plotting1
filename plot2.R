library(data.table);

#data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- read.table("subsetted_dates.txt", sep=";", header=TRUE, 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings="?", stringsAsFactors=FALSE)

#Convert the Date column to dates
#data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

#Convert the Time column to times
#data$Time <- strptime(data$Time, format="%H:%M:%S")

#Create datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
plot(datetime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(x=datetime, y=data$Global_active_power)
dev.off()