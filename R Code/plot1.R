#Fatin Fatihah Zahari
#Exploratory Data Analysis
#Project 1 - plot1.R for plot1.png

#Fetch Raw Data
rawFile <- "./data/household_power_consumption.txt"
mydata<- read.table(rawFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetmydata <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Data Analysis
globalactivepower <- as.numeric(subsetmydata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



