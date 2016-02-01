#code for plot3.R

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

##filter data
data <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

##create DateTime column with lubridate
DateTime <- ymd_hms(paste(filtered$Date, filtered$Time))

#add to data frame
filtered <- cbind(filtered, DateTime)

##plot with multiple lines?

plot(filtered$DateTime, filtered$Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering") 
points(filtered$DateTime, filtered$Sub_metering_1, type = "l", col = "black")
points(filtered$DateTime, filtered$Sub_metering_2, type = "l", col = "red")
points(filtered$DateTime, filtered$Sub_metering_3, type = "l", col = "blue")

##Create a legend in top right corner
legend("topright", lty= "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

