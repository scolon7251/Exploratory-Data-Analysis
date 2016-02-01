##Code for plot4.R (multiplot)


data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

##filter data
data <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

##create DateTime column with lubridate
DateTime <- ymd_hms(paste(filtered$Date, filtered$Time))

#add to data frame
filtered <- cbind(filtered, DateTime)

#plot the fourth graph
plot(filtered$DateTime, filtered$Global_reactive_power, type = "l",
     xlab = "datetime",ylab = "Global_reactive_power")

##Put all 4 plots into one display
par(mfrow = c(2,2))
with(filtered, {
        plot(filtered$DateTime, filtered$Global_active_power, xlab ="", ylab = "Global Active Power", type = "l") 
        plot(filtered$DateTime, filtered$Voltage, xlab= "datetime", ylab = "Voltage", type = "l")
        plot(filtered$DateTime, filtered$Sub_metering_1, type = "n", xlab = "",ylab = "Energy sub metering") 
        points(filtered$DateTime, filtered$Sub_metering_1, type = "l", col = "black")
        points(filtered$DateTime, filtered$Sub_metering_2, type = "l", col = "red")
        points(filtered$DateTime, filtered$Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty= "solid", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(filtered$DateTime, filtered$Global_reactive_power, type = "l",
             xlab = "datetime",ylab = "Global_reactive_power")
})

#copy to external png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
