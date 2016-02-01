##Read in the necessary data
library(dplyr)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Search through SCC df to find instances of "coal"
index = grep("Coal", SCC$EI.Sector)
coal <- SCC[index,]

##Map to NEI plot based on common SCC ID #
merged <- merge(coal, NEI)

##coal$SCC <- as.character(as.factor(coal$SCC))

##sum emissions from coal
summed <- summarise(group_by(merged, year), emissions=sum(Emissions))

##Change year to factor, for plotting purposes
summed$year <- as.factor(as.numeric(summed$year))

##Plot data graph, but need to do at log scale
library(scales)
g <- ggplot(data = summed, aes(x=year, y = emissions)) +scale_y_continuous(labels=comma)
g + geom_bar(stat = "identity") + labs(title = "Total PM2.5 Emissions from Coal Sources\n United States, 1999-2008", y="Emissions (tons)")

##Save plot to png
dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")
dev.off()
