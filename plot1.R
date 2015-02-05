## Step1: getting & cleaning data

a <- read.table("household_power_consumption.txt", colClasses = "character", sep = ";", header = TRUE)
a <- a[which(a$Date == "1/2/2007" | a$Date == "2/2/2007"), ]
a$Date <- as.Date(a$Date, "%e/%m/%Y")
a$Date <- paste(a$Date, a$Time, sep = " ")
colnames(a)[1] <- "Date"
a <- a[-c(2)]
a$Date <- strptime(a$Date, "%Y-%m-%d %H:%M:%S")
a[, 2] <- as.numeric(a[, 2])

## Step2: plot1

 ### Step2.1: open png device

png(file = "plot1.png", width = 480, height = 480, units = "px", bg = NA)

 ### Step2.2: hist

with(a, hist(
        a$Global_active_power, 
             col = "red", 
             main = "Global Active Power", 
             xlab = "Global Active Power (kilowatts)"
        )
     )

## Step3: close graphics

dev.off()