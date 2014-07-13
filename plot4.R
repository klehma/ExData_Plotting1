colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=colClasses)
d$DT <- strptime(paste(as.Date(d$Date,format="%d/%m/%Y"),d$Time),format="%Y-%m-%d %H:%M:%S")

dval <- subset(d, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") 
               | as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

par(mfrow=c(2,2))

plot(dval$DT,dval$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dval$DT,dval$Global_active_power,type="l")

plot(dval$DT,dval$Voltage,type="n",xlab="datetime",ylab="Global Active Power (kilowatts)")
lines(dval$DT,dval$Voltage,type="l")

plot(dval$DT,dval$Sub_metering_1,type="n",xlab="",ylab="Energy sub Metering")
lines(dval$DT,dval$Sub_metering_1,type="l",col="black")
lines(dval$DT,dval$Sub_metering_2,type="l",col="red")
lines(dval$DT,dval$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

plot(dval$DT,dval$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(dval$DT,dval$Global_reactive_power,type="l")

png("plot4.png")
par(mfrow=c(2,2))

plot(dval$DT,dval$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dval$DT,dval$Global_active_power,type="l")

plot(dval$DT,dval$Voltage,type="n",xlab="datetime",ylab="Global Active Power (kilowatts)")
lines(dval$DT,dval$Voltage,type="l")

plot(dval$DT,dval$Sub_metering_1,type="n",xlab="",ylab="Energy sub Metering")
lines(dval$DT,dval$Sub_metering_1,type="l",col="black")
lines(dval$DT,dval$Sub_metering_2,type="l",col="red")
lines(dval$DT,dval$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

plot(dval$DT,dval$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(dval$DT,dval$Global_reactive_power,type="l")
dev.off()