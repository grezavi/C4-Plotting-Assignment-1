## Beginning of program.

## Import data and take it out for a spin

epc <- read.table(file.choose(),header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
attach(epc)
str(epc)
head(epc,10)

## Change dates and times as recommended 

epc$Time <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
str(epc)

## Only use the household data between the dates 2007-02-01 and 2007-02-02.

Dates2 <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
epc2 <- subset(epc, Date %in% Dates2)
head(epc2,10)

## Creating Plot4

png("plot4.png", width=400, height=400)
par(mfrow=c(2,2))

plot(epc2$Time, epc2$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(epc2$Time, epc2$Voltage, type="l",xlab="datetime", ylab="Voltage")

plot(epc2$Time, epc2$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
  lines(epc2$Time, epc2$Sub_metering_2, col="red")
  lines(epc2$Time, epc2$Sub_metering_3, col="blue")
  legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,box.lwd=0)

plot(epc2$Time, epc2$Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power")
  lines(epc2$Time, epc2$Global_reactive_power)
dev.off()

## End of program.
