setwd("~/Google Drive/Data Science/04. Exploratory Data Analysis/datascience04_project02/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)

# Coal-related SCC # and sources
coal_SCC <- as.character(SCC[grepl("Coal", SCC$EI.Sector),]$SCC)
coal_sources <- filter(NEI, SCC %in% coal_SCC)
# group by year
agg_coal_sources <- aggregate(Emissions ~ year, coal_sources, sum)

# open png device
png(filename="plot4.png", bg="transparent", width=800, height=800)

# plot
plot(agg_coal_sources, main = "Emissions from coal combustion-related sources", xlab = "Year")
lines(agg_coal_sources)

# close the device
dev.off()



