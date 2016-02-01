##Read in the necessary data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Use dplyr to group data by year, and calculate sum of emissions for each year
library(dplyr)
summed <- summarise(group_by(NEI, year), emissions = sum(Emissions))

##create plot to display data, divide by 1000000 so you can plot in megatons
plot1 <- plot(summed$year, summed$emissions/1000000, type = "l", xlab = "year", ylab = "Emissions of PM2.5 (Megatons)",main = "Total Emissions from PM2.5 in the US\n 1999-2008", xaxt = "n", ylim=c(3,8))
axis(1, at = summed$year, labels = TRUE)

##Save plot to png
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
