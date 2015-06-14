setwd("~/Google Drive/Data Science/04. Exploratory Data Analysis/datascience04_project02/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# group by year
emission_per_year = aggregate(Emissions ~ year, NEI, sum)

# open png device
png(filename="plot1.png", bg="transparent", width=800, height=800)

# plot
plot(emission_per_year, main = "Total PM2.5 emissions, 1999-2008", xlab = "Year")
lines(emission_per_year)

# close the device
dev.off()

