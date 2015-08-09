data <- read.table("household_power_consumption.txt",header=TRUE,sep=";") ## read data
data[,'Date'] <- as.Date(data[,'Date'],"%d/%m/%Y")
useddates <- as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
used <- data[data$Date %in% useddates,]   ## choose needed dates

x <- paste(used$Date,used$Time)
timeline <- strptime(x,"%Y-%m-%d %H:%M:%S")
head(timeline)

library(datasets)
used$Global_active_power[used$Global_active_power=="?"] <- NA
used$Global_active_power <- as.numeric(levels(used$Global_active_power)[used$Global_active_power])
used$Global_reactive_power[used$Global_reactive_power=="?"] <- NA
used$Global_reactive_power <- as.numeric(levels(used$Global_reactive_power)[used$Global_reactive_power])

par(mfrow = c(2, 2))

plot(timeline,used$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
plot(timeline,used$Voltage, ylab="Voltage", xlab="", type="l")
plot(timeline,used$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l", col="black")
lines(timeline,used$Sub_metering_2, col="red")
lines(timeline,used$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(timeline,used$Global_reactive_power, ylab="Global_reactive_power", xlab="", type="l")

dev.copy(png, file = "plot4.png")
dev.off()
