power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
power_data <- within(power_data, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot2.png")
with(power_data, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(power_data, lines(datetime, Global_active_power))
dev.off()