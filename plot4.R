## Load and select data subset
library(data.table)
d <- fread("household_power_consumption.txt")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"), ]
numcols <- c(3:dim(d)[2])
d[, (numcols) := lapply(.SD, as.numeric), .SDcols = numcols]

## make plot4.png
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(d$Global_active_power,
     type="l",
     xlab="",
     xaxt="n",
     ylab="Global Active Power")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

plot(d$Voltage, type="l", xlab="datetime", xaxt="n", ylab="Voltage")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

plot(d$Sub_metering_1, type="l", xlab="", xaxt="n", ylab="Energy sub metering")
lines(d$Sub_metering_2, col="red")
lines(d$Sub_metering_3, col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright",
       bty="n",
       lty=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(d$Global_reactive_power,
     type="l",
     xlab="datetime",
     xaxt="n",
     ylab="Global_reactive_power")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))

dev.off()
