setwd("~/Google Drive/Data Science/04. Exploratory Data Analysis/datascience04_project02/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)

# filter baltimore city, group by year
baltimore_city = filter(NEI, fips == "24510")
emission_per_year_bal = aggregate(Emissions ~ year, baltimore_city, sum)

# open png device
png(filename="plot2.png", bg="transparent", width=800, height=800)

# plot
plot(emission_per_year_bal, main = "Total PM2.5 emissions in Baltimore City, 1999-2008", xlab = "Year")
lines(emission_per_year_bal)

# close the device
dev.off()


