## Step1: getting & cleaning data

a <- read.table("household_power_consumption.txt", colClasses = "character", sep = ";", header = TRUE)
a <- a[which(a$Date == "1/2/2007" | a$Date == "2/2/2007"), ]
a$Date <- as.Date(a$Date, "%e/%m/%Y")
a$Date <- paste(a$Date, a$Time, sep = " ")
colnames(a)[1] <- "Date"
a <- a[-c(2)]
a$Date <- strptime(a$Date, "%Y-%m-%d %H:%M:%S")
a[, 6] <- as.numeric(a[, 6])
a[, 7] <- as.numeric(a[, 7])
a[, 8] <- as.numeric(a[, 8])

## Step2: plot3

 ### Step2.1: open png device

png(file = "plot3.png", width = 480, height = 480, units = "px", bg = NA)

 ### Step2.2: 1st plot

with(a, plot(
        Date, Sub_metering_1, 
        type = "l", 
        xlab = NA, 
        ylab = "Energy sub metering"
        )
     )

 ### Step2.3: 2nd plot

lines(a$Date, 
      a$Sub_metering_2, 
      col = "red"
      )

 ### Step2.4: 3rd plot

lines(a$Date, 
      a$Sub_metering_3, 
      col = "blue"
      )

 ### Step2.5: legend

legend("topright", 
       lty = 1, 
       lwd = 0.8, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                  )
       )

## Step3: close graphics

dev.off()