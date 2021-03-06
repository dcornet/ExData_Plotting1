# Installing and loading all required library
if("data.table" %in% rownames(installed.packages()) == FALSE) {
    install.packages("data.table")}
if("downloader" %in% rownames(installed.packages()) == FALSE) {
    install.packages("downloader")}
library(data.table)
library(downloader)

# Downloading, unziping and reading the data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download(fileURL, "Fhousehold_power_consumption.zip", mode="wb")
unzip("Fhousehold_power_consumption.zip", exdir="./data")
df<- fread("./data/household_power_consumption.txt",skip="1/2/2007",nrows=48*60)
colnames(df)<-names(fread("./data/household_power_consumption.txt",nrows=1))

# Converting the Date and Time variables to Date/Time classes
df$DateTime<-as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))

# Plotting energy sub metering over time
png(height=480, width=480, filename="Plot3.png")
plot(df$DateTime, df$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2, col="red")
lines(df$DateTime,df$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5,col=c("black", "blue","red")) 
dev.off()