#Fatin Fatihah Zahari
#Exploratory Data Analysis
#Project 1 - plot4.R for plot4.png

#Fetch Raw Data
rawFile <- "./data/household_power_consumption.txt"
mydata<- read.table(rawFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetmydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]


#Data Analysis
datetime<-strptime(paste(subsetmydata$Date, subsetmydata$Time, sep=""), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subsetmydata$Global_active_power)
globalreactivepower<-as.numeric(subsetmydata$Global_reactive_power)
voltage<-as.numeric(subsetmydata$Voltage)
subsetmeter1<-as.numeric(subsetmydata$Sub_metering_1)
subsetmeter2<-as.numeric(subsetmydata$Sub_metering_2)
subsetmeter3<-as.numeric(subsetmydata$Sub_metering_3)

#Graphics Device coding
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#Global Active Power
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Voltage
plot(datetime, voltage,type="l", xlab="datetime", ylab="Voltage")


#All the other
plot(datetime, subsetmeter1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subsetmeter2, type="l", col="red")
lines(datetime, subsetmeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"))

#Global Reactive Power
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()