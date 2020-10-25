setwd("/Users/yahsintsai/Downloads")
data <- read.table("household_power_consumption.txt", sep=";", header = T)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
tmp <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
tmp$datetime <- as.POSIXct(paste(tmp$Date,tmp$Time),tz="UCT")

png(filename="plot3.png")
plot(tmp$datetime, as.numeric(tmp$Sub_metering_1), type = "l", xlab = " ", ylab = "Energy sub metering")
lines(tmp$datetime, as.numeric(tmp$Sub_metering_2), type = "l", col = "red")
lines(tmp$datetime, as.numeric(tmp$Sub_metering_3), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1, 1), col = c(1, 2, 4))
dev.off()

