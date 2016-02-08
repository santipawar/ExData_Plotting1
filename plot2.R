## Load and select data subset
library(data.table)
d <- fread("household_power_consumption.txt")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"), ]
numcols <- c(3:dim(d)[2])
d[, (numcols) := lapply(.SD, as.numeric), .SDcols = numcols]

## make plot2.png
png(filename="plot2.png", width=480, height=480)
plot(d$Global_active_power,
     type="l",
     xlab="",
     xaxt="n",
     ylab="Global Active Power (kilowatts)")
axis(1, at=c(1,1440,2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
