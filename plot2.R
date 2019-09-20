## Generating Plot 2
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

#make the plot
plot(subdata$datetime, subdata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)")

#save plot to file
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()