raw<-"C:/Users/JLsky/Documents/data science/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt"
 
getdata <- read.table(raw, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 
Data <- getdata[getdata$Date %in% c("1/2/2007","2/2/2007") ,] 

GlobalActivePower <- as.numeric(Data$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off() 

