colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

d <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=colClasses)
d$DT <- strptime(paste(as.Date(d$Date,format="%d/%m/%Y"),d$Time),format="%Y-%m-%d %H:%M:%S")

dval <- subset(d, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") 
               | as.Date(Date,format="%d/%m/%Y") == as.Date("02/02/2007",format="%d/%m/%Y"))

plot(dval$DT,dval$Sub_metering_1,type="n",xlab="",ylab="Energy sub etering")
lines(dval$DT,dval$Sub_metering_1,type="l",col="black")
lines(dval$DT,dval$Sub_metering_2,type="l",col="red")
lines(dval$DT,dval$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))

png("plot3.png")
plot(dval$DT,dval$Sub_metering_1,type="n",xlab="",ylab="Energy sub Metering")
lines(dval$DT,dval$Sub_metering_1,type="l",col="black")
lines(dval$DT,dval$Sub_metering_2,type="l",col="red")
lines(dval$DT,dval$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
