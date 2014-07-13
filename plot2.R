colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=colClasses)
d$DT <- strptime(paste(as.Date(d$Date,format="%d/%m/%Y"),d$Time),format="%Y-%m-%d %H:%M:%S")

dval <- subset(d, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") 
               | as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

plot(dval$DT,dval$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dval$DT,dval$Global_active_power,type="l")

png("plot2.png")
plot(dval$DT,dval$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dval$DT,dval$Global_active_power,type="l")
dev.off()
