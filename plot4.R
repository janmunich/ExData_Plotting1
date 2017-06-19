power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

# plot4
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
global_active_power <- as.numeric(subset_data$Global_active_power)
voltage <- as.numeric(subset_data$Voltage)
sub_metering1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering3 <- as.numeric(subset_data$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type = "l", xlab = "", ylab="Global Active Power", cex = 0.2)

plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(datetime, sub_metering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, sub_metering2, type = "l", col = "red")
lines(datetime, sub_metering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = , lwd = 2.5, col = c("black", "red", "blue"), bty = "o")

plot(datetime, global_active_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()