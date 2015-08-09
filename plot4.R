raw<-"C:/Users/JLsky/Documents/data science/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"

getdata <- read.table(raw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
Data <- getdata[getdata$Date %in% c("1/2/2007","2/2/2007") ,] 

Datetime<- paste(Data$Date, Data$Time, sep=" ")
Data$Datetime<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(Data$Global_active_power)
png("plot4.png", width=480, height=480) 
par(mfrow = c(2,2))
with(Data,{
plot(Data$Datetime, GlobalActivePower,type= "l",ylab = "Global Active Power (Kilowatts)", xlab = "")

plot(Data$Datetime, Data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(Data$Datetime, Data$Sub_metering_1,type= "l",col = "black",ylab = "Energy sub metering", xlab = "")
lines(Data$Datetime, Data$Sub_metering_2, col = "red")
lines(Data$Datetime, Data$Sub_metering_3, col = "blue")

plot(Data$Datetime, Data$Global_reactive_power, type = "l", ylab = "", xlab = "datetime")

})

dev.off()
