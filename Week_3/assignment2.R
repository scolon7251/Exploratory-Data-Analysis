##Assignment # 2

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Creating Graph
hist(NEI$Emissions)

##create first plot
plot1 <- plot(summed$year, summed$emissions, type = "l", xlab = "year", ylab = "Emissions", main = "Total Emissions from PM2.5 in the US", xaxt = "n")
axis(1, at = summed$year, labels = TRUE)

