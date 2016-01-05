library(data.table);

#data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
data <- read.table("subsetted_dates.txt", sep=";", header=TRUE, 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                   na.strings="?", stringsAsFactors=FALSE)

#Convert the Date column to dates
#data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

#Convert the Time column to times
#data$Time <- strptime(data$Time, format="%H:%M:%S")

#Create datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
plot(datetime,data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="n")
lines(datetime,data$Sub_metering_1, col="black")
lines(datetime,data$Sub_metering_2, col="red")
lines(datetime,data$Sub_metering_3, col="blue")
legend("topright",lty=1, col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()