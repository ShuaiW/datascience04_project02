setwd("~/Google Drive/Data Science/04. Exploratory Data Analysis/datascience04_project02/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)

# "Mobile - On-Road" as motor vehicle
motor_SCC <- as.character(SCC[grepl("Mobile - On-Road", SCC$EI.Sector),]$SCC)
# Baltimore motor
motor_baltimore <- filter(NEI, SCC %in% motor_SCC, fips == "24510")
# group by year
agg_motor_baltimore <- aggregate(Emissions ~ year, motor_baltimore, sum)


# open png device
png(filename="plot5.png", bg="transparent", width=800, height=800)

# plot
plot(agg_motor_baltimore, main = "Emissions from motor vehicle in Baltimore City", xlab = "Year")
lines(agg_motor_baltimore)

# close the device
dev.off()