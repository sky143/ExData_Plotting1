raw<-"C:/Users/JLsky/Documents/data science/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"

getdata <- read.table(raw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
Data <- getdata[getdata$Date %in% c("1/2/2007","2/2/2007") ,] 

GlobalActivePower <- as.numeric(Data$Global_active_power)
Datetime<- paste(Data$Date, Data$Time, sep=" ")
Data$Datetime<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480) 
plot(Data$Datetime, GlobalActivePower,type= "l",ylab = "Global Active Power (Kilowatts)", xlab = "")

dev.off()

