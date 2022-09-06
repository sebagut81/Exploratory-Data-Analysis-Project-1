install.packages("sqldf")
library(sqldf)

# Read the required rows from the file 
epwrconsumption <- read.csv.sql("../Week1/household_power_consumption.txt", 
                    "select * from file where Date = '1/2/2007' 
                    or Date = '2/2/2007' ", sep=";", header = TRUE)

# Convert Date & Time column into Date/Time class
epwrconsumption[['Date']] <- strptime(paste(epwrconsumption$Date, epwrconsumption$Time,sep = " "),
                                      format = '%d/%m/%Y %H:%M:%S')

# Remove column Time
epwrconsumption <- epwrconsumption[names(epwrconsumption) != "Time"]

#Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(epwrconsumption$Global_active_power, xlab = 'Global Active Power (kilowatts)', 
     main = "Global Active Power", col = 'red')
dev.off()

#Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(epwrconsumption$Date, epwrconsumption$Global_active_power, type = "l",
     xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()

#Plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(epwrconsumption$Date, epwrconsumption$Sub_metering_1, type = "l",
     xlab = '', ylab = 'Global Active Power (kilowatts)', col = "black")
lines(epwrconsumption$Date, epwrconsumption$Sub_metering_2, col = "red")
lines(epwrconsumption$Date, epwrconsumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lty = c(1,1,1), col = c("black", "red", "blue"))
dev.off()

#Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
par(cex = 0.6)
plot(epwrconsumption$Date, epwrconsumption$Global_active_power, type = "l",
     xlab = '', ylab = 'Global Active Power (kilowatts)')
plot(epwrconsumption$Date, epwrconsumption$Sub_metering_1, type = "l",
     xlab = '', ylab = 'Global Active Power (kilowatts)', col = "black")
lines(epwrconsumption$Date, epwrconsumption$Sub_metering_2, col = "red")
lines(epwrconsumption$Date, epwrconsumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))
plot(epwrconsumption$Date, epwrconsumption$Voltage, type = "l",
     xlab = 'datetime', ylab = 'Voltage')
plot(epwrconsumption$Date, epwrconsumption$Global_reactive_power, type = "l",
     xlab = 'datetime', ylab = 'Global_reactive_power')
dev.off()