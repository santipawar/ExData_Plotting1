## Load and select data subset
library(data.table)
d <- fread("household_power_consumption.txt")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"), ]
numcols <- c(3:dim(d)[2])
d[, (numcols) := lapply(.SD, as.numeric), .SDcols = numcols]

## make plot1.png
png(filename="plot1.png", width=480, height=480)
hist(d$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()

