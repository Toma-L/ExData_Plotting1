## Step1: getting & cleaning data

a <- read.table("household_power_consumption.txt", colClasses = "character", sep = ";", header = TRUE)
a <- a[which(a$Date == "1/2/2007" | a$Date == "2/2/2007"), ]
a$Date <- as.Date(a$Date, "%e/%m/%Y")
a$Date <- paste(a$Date, a$Time, sep = " ")
colnames(a)[1] <- "Date"
a <- a[-c(2)]
a$Date <- strptime(a$Date, "%Y-%m-%d %H:%M:%S")
a[, 2] <- as.numeric(a[, 2])
a[, 3] <- as.numeric(a[, 3])
a[, 4] <- as.numeric(a[, 4])
a[, 6] <- as.numeric(a[, 6])
a[, 7] <- as.numeric(a[, 7])
a[, 8] <- as.numeric(a[, 8])

## Step2: plot2

 ### Step2.1: open png device

png(file = "plot4.png", width = 480, height = 480, units = "px")

 ### Step2.2: par

par(mfrow = c(2, 2))

 ### Step2.3: plot1

with(a, plot(a$Date, a$Global_active_power, type = "l", xlab = NA, ylab = "Global Active Power"))

 ### Step2.4: plot2

with(a, plot(a$Date, a$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

 ### Step2.5: plot3

with(a, plot(a$Date, a$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering"))
lines(a$Date, a$Sub_metering_2, col = "red")
lines(a$Date, a$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 0.8, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

 ### Step2.6: plot4

with(a, plot(a$Date, a$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))

## Step3: close graphics

dev.off()