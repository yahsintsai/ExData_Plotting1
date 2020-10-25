setwd("/Users/yahsintsai/Downloads")
data <- read.table("household_power_consumption.txt", sep=";", header = T)
data$Date <- as.Date(data$Date, '%d/%m/%Y')
tmp <- data[data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02"), ]

png(filename="plot1.png")
hist(as.numeric(tmp$Global_active_power),  xlab="Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power", col = "red")
dev.off()
