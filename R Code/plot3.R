#Fatin Fatihah Zahari
#Exploratory Data Analysis
#Project 1 - plot2.R for plot2.png

#Fetch Raw Data
rawFile <- "./data/household_power_consumption.txt"
mydata<- read.table(rawFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetmydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]


#Data Analysis
datetime<-strptime(paste(subsetmydata$Date, subsetmydata$Time, sep=""), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subsetmydata$Global_active_power)
subsetmeter1<-as.numeric(subsetmydata$Sub_metering_1)
subsetmeter2<-as.numeric(subsetmydata$Sub_metering_2)
subsetmeter3<-as.numeric(subsetmydata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subsetmeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subsetmeter2, type="l", col="red")
lines(datetime, subsetmeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()