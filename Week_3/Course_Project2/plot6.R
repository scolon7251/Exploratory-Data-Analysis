##Read in the necessary datasets
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset NEI to data frame with LA County and Baltimore City Data 
Baltimore_LA<- filter(NEI, NEI$fips == "24510" | NEI$fips == "06037")

##Convert year to factor
Baltimore_LA$year <- as.factor(as.numeric(Baltimore_LA$year))

##Change name fips to city names for labeling purposes
index = grep("24510", Baltimore_LA$fips)
Baltimore_LA[index,1] <- "Baltimore"
index = grep("06037", Baltimore_LA$fips)
Baltimore_LA[index,1] <- "LA"

##Find motor-vehicle emissions by subsetting with ON-ROAD
Baltimore_LA <-subset(Baltimore_LA, type == "ON-ROAD")

#Sum by year and City
summed <- summarise(group_by(Baltimore_LA, year, fips), Emissions=sum(Emissions))

##Construct Graph
g <- ggplot(summed, aes(x = year, y = Emissions))
##Add Main Label
g<- g + labs(title = "Comparison of Total PM2.5 Emissions from Motor Vehicles \nBaltimore City vs. Los Angeles County, 1999-2008") +ylab("Total PM25 Emissions")
g + facet_wrap(~fips) + geom_bar(aes(fill=fips),stat="identity") + theme(legend.title=element_blank())
