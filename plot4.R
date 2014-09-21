library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coalsScc <- filter(SCC, grepl("Coal", EI.Sector, ignore.case=TRUE));
NEI_yearly <- inner_join(NEI, coalsScc, by=c("SCC")) %>% group_by(year) %>% summarise(emissions=sum(Emissions, na.rm= TRUE))

p <- qplot(year, emissions, data=NEI_yearly,geom=c("point", "smooth"), main=expression("Total Coal related " ~ PM[2.5] ~ " Emissions in US"))
ggsave(filename="plot4.png", p, width=5, height=5, dpi=100)
