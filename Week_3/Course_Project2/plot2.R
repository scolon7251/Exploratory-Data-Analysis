##Read in the necessary data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Use dplyr to group data by year, and calculate sum of emissions for each year
library(dplyr)
baltimore <- filter(NEI, NEI$fips == "24510")
baltimore <- select(baltimore, Emissions, year)
baltimore_summed <- summarise(group_by(baltimore, year), emissions = sum(Emissions))

##create plot to display data
plot2 <- plot(baltimore_summed$year, baltimore_summed$emissions, type = "l", ylim = c(1500,3500), xaxt = "n",xlab = "year", ylab = "Emissions(tons)", main = "Total Emissions from PM2.5 in Baltimore city\n 1999-2008")
axis(1, at = summed$year, labels = TRUE)

##Save plot to png
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()
