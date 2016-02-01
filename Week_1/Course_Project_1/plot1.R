data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

##filter data
data <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

##code for plot1
hist(data_sub$Global_active_power, freq = TRUE, main = "Global Active Power", xlab ="Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
par(mar= c(1,1,1,1))

#copy to external png file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()