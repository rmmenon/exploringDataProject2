library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
onRoadSummary <- 
  NEI %>% 
    filter(fips == "24510" & type == 'ON-ROAD') %>% 
      group_by(year) %>% 
        summarize(emissions = sum(Emissions, na.rm=TRUE))

p <- qplot(year, emissions, data=onRoadSummary,geom=c("point", "smooth"), main=expression("Total Motor Vehicles related " ~ PM[2.5] ~ " Emissions in Baltimore, US"))
ggsave(filename="plot5.png", p, width=7, height=5, dpi=100)
