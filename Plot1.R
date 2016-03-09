# Load data
powerdata <- read.csv("household_power_consumption.txt", sep = ";")


powerdata$datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep = " "),
                               format = "%d/%m/%Y %H:%M:%S")
powerdata$Date <- as.Date(powerdata$Date, format ="%d/%m/%Y")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power) / 1000
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2) 
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3) 
powerdata$Voltage <- as.numeric(powerdata$Voltage)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
powerdata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02")
# Plot 1: Histogram of global active power
png('images/plot1.png', type='cairo')
with(powerdata, hist(Global_active_power, 
                     col = "red", main = "Global Active Power",
                     xlab = "Global Active Power (kilowatts)"))
dev.off()