##Plot3
library(ggplot2)
library(dplyr)

##Read in the necessary data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Filter to only baltimore data
baltimore <- filter(NEI, NEI$fips == "24510")

##Convert year to factor
baltimore$year <-as.factor(as.numeric(baltimore$year))
baltimore$type <- as.factor(as.character(baltimore$type))

##graphed with qplot
g <- qplot(year, Emissions, data = baltimore, facets = .~type, geom = "bar", stat="identity", fill = type)
g + guides(fill=FALSE) + labs(y = "PM2.5 Emissions(tons)", title = "PM2.5 Emissions in Baltimore City 1999-2008 By Source Type")


##Save plot to png
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px")
dev.off()


