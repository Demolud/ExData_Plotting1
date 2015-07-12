#read data
table<-read.table(file="household_power_consumption.txt", col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",na.string="?", skip = 66637, nrows= 2880)
table$Date<-strptime(paste(table$Date, table$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")


#Plot 2
locale<-Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "UK")
png(file="plot2.png", width=480, height=480)
plot(table$Date, table$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
Sys.setlocale("LC_TIME", locale)