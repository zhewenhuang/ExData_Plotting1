a <- read.table("/Users/Downloads/household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE)

subdata <- a[a$Date %in% c("1/2/2007","2/2/2007") ,]
time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subdata$Global_active_power)

png("plot2.png",480,480)
plot(x=time,y=gap,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l")

dev.off()
