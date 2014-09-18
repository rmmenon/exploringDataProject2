library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_yearly <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
    summarize(yearlyEmissions=sum(Emissions, na.rm=TRUE))
png("plot3.png", width=480, height=480);
qplot(year, yearlyEmissions, data=NEI_yearly, color=type, facets=.~type, geom=c("point", "smooth"));
dev.off();
