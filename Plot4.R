data<-read.table("./household_power_consumption.txt", skip = 1, sep = ";", stringsAsFactors = FALSE)
names(data)<-c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
               "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
datetime<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(datetime, as.numeric(as.character(data$Global_active_power)), type = "l",
     xlab = "", ylab = "Global Active Power")
plot(datetime, as.numeric(as.character(data$Voltage)), type = "l", ylab = "Voltage")
plot(datetime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Sub metering")
lines(datetime, as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(datetime, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datetime, as.numeric(as.character(data$Global_reactive_power)), type = "l"
     , ylab = "Global_rective_power")
dev.off()