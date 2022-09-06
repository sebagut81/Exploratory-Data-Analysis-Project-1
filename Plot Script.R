install.packages("sqldf")
library(sqldf)

# Read the required rows from the file 
epwrconsumption <- read.csv.sql("../Week1/household_power_consumption.txt", 
                    "select * from file where Date = '01/02/2007' 
                    or Date = '2/2/2007' ", sep=";", header = TRUE)

# Convert Date & Time column into Date/Time class
epwrconsumption[['Date']] <- strptime(paste(epwrconsumption$Date, epwrconsumption$Time,sep = " "),
                                      format = '%m/%d/%Y %H:%M:%S')

# Remove column Time
epwrconsumption <- epwrconsumption[names(epwrconsumption) != "Time"]

#Plot 1
hist(epwrconsumption$Global_active_power)
