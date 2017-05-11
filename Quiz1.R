#### Quiz1. Electric Data consumption Dataset ####

# Open Data

setwd("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 1 Explanatory Data Analisys")


Data <- read.table("C:/Users/MXI02003837A/Desktop/Material Data Science/Quizz 1 Explanatory Data Analisys/Data/household_power_consumption.txt", header=T,sep=";")

Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data_f <- Data[(Data$Date=="2007-02-01") | (Data$Date=="2007-02-02"),]
Data_f$Global_active_power <- as.numeric(as.character(Data_f$Global_active_power))
Data_f$Global_reactive_power <- as.numeric(as.character(Data_f$Global_reactive_power))
Data_f$Voltage <- as.numeric(as.character(Data_f$Voltage))
Data_f <- transform(Data_f, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
Data_f$Sub_metering_1 <- as.numeric(as.character(Data_f$Sub_metering_1))
Data_f$Sub_metering_2 <- as.numeric(as.character(Data_f$Sub_metering_2))
Data_f$Sub_metering_3 <- as.numeric(as.character(Data_f$Sub_metering_3))

# Plot 1

Plot1 <- hist(Data_f$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()

# Plot 2

Plot2 <- plot(Data_f$timestamp,Data_f$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()

# Plot 3

Plot3 <- plot(Data_f$timestamp,Data_f$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(Data_f$timestamp,Data_f$Sub_metering_2,col="red")

lines(Data_f$timestamp,Data_f$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="Plot3.png", width=480, height=480)
dev.off()

# Plot 4

par(mfrow=c(2,2))

plot(Data_f$timestamp,Data_f$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(Data_f$timestamp,Data_f$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(Data_f$timestamp,Data_f$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(Data_f$timestamp,Data_f$Sub_metering_2,col="red")

lines(Data_f$timestamp,Data_f$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly

plot(Data_f$timestamp,Data_f$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()
