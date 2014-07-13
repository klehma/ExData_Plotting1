colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=colClasses)
d$DT <- strptime(paste(as.Date(d$Date,format="%d/%m/%Y"),d$Time),format="%Y-%m-%d %H:%M:%S")

dval <- subset(d, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") 
    | as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

hist(dval$Global_active_power, col="red", xlim=c(0,6), ylim=c(0,1200), breaks=12,
     xlab="Global Active Power (kilowatts)", main="Global Active Power")

png("plot1.png")
hist(dval$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
