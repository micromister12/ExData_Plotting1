power_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
power_data <- subset(power_data, Date == "1/2/2007" | Date == "2/2/2007")
power_data <- within(power_data, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png("plot4.png")
par(mfcol=c(2, 2))
with(power_data, plot(datetime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(power_data, lines(datetime, Global_active_power))

with(power_data, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(power_data, lines(datetime, Sub_metering_1))
with(power_data, lines(datetime, Sub_metering_2, col="red"))
with(power_data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", bty="n", lty=c(1, 1, 1), lwd=c(1, 1, 1),  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

with(power_data, plot(datetime, Voltage, type="n"))
with(power_data, lines(datetime, Voltage))

with(power_data, plot(datetime, Global_reactive_power, type="n"))
with(power_data, lines(datetime, Global_reactive_power))
dev.off()