setwd("/Users/yahsintsai/Downloads")
data <- read.table("household_power_consumption.txt", sep=";", header = T)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
tmp <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
tmp$datetime <- as.POSIXct(paste(tmp$Date,tmp$Time),tz="UCT")

png(filename="plot4.png")
par(mfrow=c(2,2))
#plot1
plot(tmp$datetime, as.numeric(tmp$Global_active_power), type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
#plot2
plot(tmp$datetime, as.numeric(tmp$Voltage), type = "l", xlab = " ", ylab = "Voltage")
#plot3
plot(tmp$datetime, as.numeric(tmp$Sub_metering_1), type = "l", xlab = " ", ylab = "Energy sub metering")
lines(tmp$datetime, as.numeric(tmp$Sub_metering_2), type = "l", col = "red")
lines(tmp$datetime, as.numeric(tmp$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c(1, 2, 4))
#plot4
plot(tmp$datetime, as.numeric(tmp$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

