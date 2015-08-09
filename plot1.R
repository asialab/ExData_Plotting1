data <- read.table("household_power_consumption.txt",header=TRUE,sep=";") ## read data
data[,'Date'] <- as.Date(data[,'Date'],"%d/%m/%Y")
useddates <- as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
used <- data[data$Date %in% useddates,]   ## choose needed dates

library(datasets)
used$Global_active_power[used$Global_active_power=="?"] <- NA
used$Global_active_power <- as.numeric(levels(used$Global_active_power)[used$Global_active_power])

hist(used$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
