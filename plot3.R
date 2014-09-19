library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_yearly <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
    summarize(emissions=sum(Emissions, na.rm=TRUE))
plot <- qplot(year, emissions, data=NEI_yearly, color=type, facets=.~type, geom=c("point", "smooth"), main=expression("Total " ~ PM[2.5] ~ " Emissions in Baltimore, Maryland, USA"));
ggsave (filename="plot3.png", plot=plot, height=3, width=10, dpi=100)
