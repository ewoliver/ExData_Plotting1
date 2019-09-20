#Read the file
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")

#Format the Date
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Subset the data with Date of "2007-02-01" & "2007-02-02"
subdata<-data[which(data$Date=="2007-02-01" | data$Date=="2007-02-02"),]

#Combine Data & Time
datetime <- paste(subdata$Date, subdata$Time)
datetime <-setNames(datetime, "DateTime")
subdata <- cbind(datetime, subdata)
subdata$datetime <- as.POSIXct(datetime)

#Generate Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
        plot(datetime, Global_active_power, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(datetime, Voltage, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(datetime, Sub_metering_1, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(datetime, Sub_metering_2,col='Red')
        lines(datetime, Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datetime, Global_reactive_power, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})

#save plot to file
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()

