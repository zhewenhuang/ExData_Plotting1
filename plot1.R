a <- read.table("/Users/Downloads/household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,header = TRUE)

subdata <- a[a$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(subdata$Global_active_power)

png("plot1.png",480,480)
hist(gap,xlab = "Global Active Power (kilowatts)",main="Global Active Power",col="red")

dev.off()
