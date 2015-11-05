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

# Plotting histogram of global active power
png(height=480, width=480, filename="Plot1.png")
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)",
     main="Global Active Power", col="tomato")
dev.off()