library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Assume that type="ON-ROAD" signifies all motor vehicles related records.
onRoadSummary <- 
  NEI %>% 
    filter((fips == "24510"| fips == "06037") & type == 'ON-ROAD') %>% 
      group_by(year, fips) %>% 
        summarize(emissions = sum(Emissions, na.rm=TRUE))

p <- qplot(year, emissions, data=onRoadSummary,geom=c("point", "smooth"), facets=.~fips, main=expression("Motor Vehicles related " ~ PM[2.5] ~ " Emissions Baltimore Vs Los Angeles"))
ggsave(filename="plot6.png", p, width=7, height=5, dpi=100)
