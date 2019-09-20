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



## Create Plot 3
with(subdata, {
        plot(datetime, Sub_metering_1, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(datetime, Sub_metering_2,col='Red')
        lines(datetime, Sub_metering_3,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#save plot to file
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
