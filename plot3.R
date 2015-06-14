setwd("~/Google Drive/Data Science/04. Exploratory Data Analysis/datascience04_project02/")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)
require(ggplot2)
require(gridExtra)

# partition by type, group by year
point <- filter(NEI, type == "POINT", fips == "24510")
nonpoint <- filter(NEI, type == "NONPOINT", fips == "24510")
on_road <- filter(NEI, type == "ON-ROAD", fips == "24510")
non_road <- filter(NEI, type == "NON-ROAD", fips == "24510")

emission_point <- aggregate(Emissions ~ year, point, sum)
emission_nonpoint <- aggregate(Emissions ~ year, nonpoint, sum)
emission_on_road <- aggregate(Emissions ~ year, on_road, sum)
emission_non_road <- aggregate(Emissions ~ year, non_road, sum)


# open png device
png(filename="plot3.png", bg="transparent", width=800, height=800)

# 4 plots on one graph
plot_point <- qplot(year, Emissions, data=emission_point, main = "Baltimore City PM2.5 (POINT)", geom=c("point","smooth"))
plot_nonpoint <- qplot(year, Emissions, data=emission_nonpoint, main = "Baltimore City PM2.5 (NONPOINT)", geom=c("point","smooth"))
plot_on_road <- qplot(year, Emissions, data=emission_on_road, main = "Baltimore City PM2.5 (ON-ROAD)", geom=c("point","smooth"))
plot_non_road <- qplot(year, Emissions, data=emission_non_road, main = "Baltimore City PM2.5 (NON-ROAD)", geom=c("point","smooth"))
grid.arrange(plot_point, plot_nonpoint, plot_on_road, plot_non_road)

# close the device
dev.off()


# group by year and type, and plot using facets 
# (not good because Y axis is the same scale for all four)
#emissions_year_type <- aggregate(Emissions ~ year + type, NEI, sum)
#qplot(year, Emissions, data=emissions_year_type, color=type, geom=c("point","smooth"))

