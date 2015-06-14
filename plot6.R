setwd("~/Google Drive/Data Science/04. Exploratory Data Analysis/datascience04_project02/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)
require(ggplot2)
require(plyr)

# "Mobile - On-Road" as motor vehicle
motor_SCC <- as.character(SCC[grepl("Mobile - On-Road", SCC$EI.Sector),]$SCC)
# Baltimore and LA motor
motor_baltimore_LA <- filter(NEI, SCC %in% motor_SCC, fips %in% c("24510", "06037"))

# open png device
png(filename="plot6.png", bg="transparent", width=800, height=800)

# fips -> City; year -> Year; map value to city name; then plot
agg_motor_baltimore_LA <- aggregate(Emissions ~ year + fips, motor_baltimore_LA, sum)
colnames(agg_motor_baltimore_LA)[2] <- "City"
colnames(agg_motor_baltimore_LA)[1] <- "Year"
agg_motor_baltimore_LA$City <- revalue(agg_motor_baltimore_LA$City, c("24510"="Baltimore City", "06037"="Los Angeles"))
qplot(Year, Emissions, data=agg_motor_baltimore_LA, color=City, geom=c("point","smooth"))

# close the device
dev.off()