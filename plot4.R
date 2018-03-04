a <- read.table("/Users/Downloads/household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE)

subdata <- a[a$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(subdata$Global_active_power)
date <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(subdata$Sub_metering_1)
sm2 <- as.numeric(subdata$Sub_metering_2)
sm3 <- as.numeric(subdata$Sub_metering_3)
grp <- as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)

par(mfrow = c(2, 2))
png("plot4.png",480,480)
plot(x=time, y=gap, type="l", xlab="", ylab="Global Active Power")

plot(x=time, y=voltage, type="l", xlab="datetime", ylab="Voltage")

plot(x=time,y=sm1,xlab = "",ylab= "Energy sub metering",type="l")
lines(x=time,y=sm2,col="red")
lines(x=time,y=sm3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), ncol = 1,cex = 0.5)

plot(x=time, y=grp, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()

