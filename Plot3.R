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
# Plot 3
png('images/plot3.png', type='cairo')
with(powerdata, plot(y=Sub_metering_1, x=datetime, type = "n",
                     xlab ="", ylab="Energy sub metering"))
with(powerdata, lines(y=Sub_metering_1,x=datetime, col = "black"))
with(powerdata, lines(y=Sub_metering_2,x=datetime, col="red"))
with(powerdata, lines(y=Sub_metering_3,x=datetime, col="blue"))
legend("topright",lty="solid",col = c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()