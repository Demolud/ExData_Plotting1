#read data
table<-read.table(file="household_power_consumption.txt", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",na.string="?", skip = 66637, nrows= 2880)
table$Date<-strptime(paste(table$Date, table$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")


#Plot 3
locale<-Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "UK")
png(file="plot3.png", width=480, height=480)
with(table, plot(table$Date, table$Sub_metering_1, type="n", xlab="",ylab="Energy sub metering"))
with(table, points(table$Date, Sub_metering_1, type="l"))
with(table, points(table$Date, Sub_metering_2, type="l", col="red"))
with(table, points(table$Date, Sub_metering_3, type="l", col="blue"))
legend ("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
Sys.setlocale("LC_TIME", locale)