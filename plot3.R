## Load and select data subset
library(data.table)
d <- fread("household_power_consumption.txt")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"), ]
numcols <- c(3:dim(d)[2])
d[, (numcols) := lapply(.SD, as.numeric), .SDcols = numcols]

## make plot3.png
png(filename="plot3.png", width=480, height=480)
plot(d$Sub_metering_1, type="l", xlab="", xaxt="n", ylab="Energy sub metering")
lines(d$Sub_metering_2, col="red")
lines(d$Sub_metering_3, col="blue")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
variables <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=variables)
dev.off()
