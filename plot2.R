setwd("/Users/yahsintsai/Downloads")
data <- read.table("household_power_consumption.txt", sep=";", header = T)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
tmp <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02", ]
tmp$datetime <- as.POSIXct(paste(tmp$Date,tmp$Time),tz="UCT")

png(filename="plot2.png")
plot(tmp$datetime, as.numeric(tmp$Global_active_power), type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
