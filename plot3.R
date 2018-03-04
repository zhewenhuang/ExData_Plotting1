a <- read.table("/Users/Downloads/household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE)

subdata <- a[a$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(subdata$Global_active_power)
date <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sm1 <- as.numeric(subdata$Sub_metering_1)
sm2 <- as.numeric(subdata$Sub_metering_2)
sm3 <- as.numeric(subdata$Sub_metering_3)

png("plot3.png",480,480)
plot(x=time,y=sm1,xlab = "",ylab= "Energy sub metering",type="l")
lines(x=time,y=sm2,col="red")
lines(x=time,y=sm3,col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
