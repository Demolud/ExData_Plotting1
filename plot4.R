#read data
table<-read.table(file="household_power_consumption.txt", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",na.string="?", skip = 66637, nrows= 2880)
table$Date<-strptime(paste(table$Date, table$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")


#Plot 4
locale<-Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "UK")
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(table$Date, table$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
plot(table$Date, table$Voltage, type="l", xlab="datetime", ylab="Voltage")
with(table, plot(table$Date, table$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering"))
with(table, points(table$Date, Sub_metering_1, type="l"))
with(table, points(table$Date, Sub_metering_2, type="l", col="red"))
with(table, points(table$Date, Sub_metering_3, type="l", col="blue"))
legend ("topright",bty="n",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(table$Date, table$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
par(mfrow=c(1,1))
Sys.setlocale("LC_TIME", locale)