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
png("plot2.png", width=480, height=480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
