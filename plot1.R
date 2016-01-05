library(data.table);

data <- fread("household_power_consumption.txt", sep=";", header=TRUE, 
              colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
              na.strings="?", stringsAsFactors=FALSE)

#Extract only the 2-1-2007 and 2-2-2007 dates
data <- subset(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#Convert the Date column to dates
data <- data[,Date:=as.Date(data$Date, format="%d/%m/%Y")]


#Convert the Time column to times
data <- data[,Time:= as.ITime(strptime(data$Time, format="%H:%M:%S"))]

#Plot a histogram of global active power
png(filename="plot1.png")
hist(data$Global_active_power, 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power",
     col="red", breaks=12)
dev.off()