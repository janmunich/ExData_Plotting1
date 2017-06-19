power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subset_data <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]


# plot2
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(subset_data$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() 

