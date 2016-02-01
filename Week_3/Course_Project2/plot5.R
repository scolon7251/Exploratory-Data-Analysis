##Read in the necessary datasets
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset to get only Baltimore City data 
baltimore <- filter(NEI, NEI$fips == "24510")

##Find motor-vehicle emissions by subsetting with ON-ROAD
vehicle <-subset(baltimore, type == "ON-ROAD")

#Sum ON-ROAD emissions by year
summed <- summarise(group_by(vehicle, year), emissions = sum(Emissions))

##Change to factors
##summed$year <- as.factor(as.numeric(summed$year))

##Plot graph to show trend
plot5 <- plot(summed$year, summed$emissions, type = "l", xaxt = "n", ylim=c(0,400), ylab = "PM2.5 Emissions (tons)", xlab="Year", main = "Total Motor Vehicle PM2.5 Emissions in Baltimore City\n 1999-2008")
axis(1, at = summed$year, labels = TRUE)

##Save plot to png
dev.copy(png, file = "plot5.png", width = 480, height = 480, units = "px")
dev.off()



