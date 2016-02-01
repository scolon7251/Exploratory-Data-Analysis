##Read in the necessary data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Use dplyr to group data by year, and calculate sum of emissions for each year
summed <- summarise(group_by(NEI, year), sum(Emissions))

##create plot to display data
plot1 <- plot(summed$year, summed$emissions, type = "l", xlab = "year", ylab = "Emissions", main = "Total Emissions from PM2.5 in the US", xaxt = "n")
axis(1, at = summed$year, labels = TRUE)

