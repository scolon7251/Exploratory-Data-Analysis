##code for plot2.R

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)

##filter data
data <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]

##create DateTime column with lubridate
DateTime <- ymd_hms(paste(filtered$Date, filtered$Time))

#add to data frame
filtered <- cbind(filtered, DateTime)

#plot the graph
plot(filtered$DateTime, filtered$Global_active_power, type = "l",
     xlab = "",ylab = "Global Active Power(kilowatts)")
par(mar= c(4,4,2,1))


