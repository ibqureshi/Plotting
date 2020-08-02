wd <- "/Users/ibraheemqureshi/R/Plotting/household_power_consumption.txt"
data <- read.table(wd, header=TRUE, sep=";")
sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

sub$Date <- as.Date(sub$Date, format="%d/%m/%Y")
format(sub$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(sub$Date), sub$Time)
datetime <- as.POSIXct(datetime)

png(file=,"/Users/ibraheemqureshi/R/Plotting/Plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(sub, plot(datetime, sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(sub, plot(datetime, sub$Voltage, type = "l", xlab = "", ylab = "Voltage"))

with(sub, plot(datetime, sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "black"))
lines(datetime, sub$Sub_metering_2, col="red")
lines(datetime, sub$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty = "n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(sub, plot(datetime, sub$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power"))

dev.off()