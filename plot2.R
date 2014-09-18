NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_yearly <- NEI %>%
  filter(fips == "24510") %>%
  group_by(year) %>%
    summarize(yearlyEmissions=sum(Emissions, na.rm=TRUE))
png("plot2.png", width=480, height=480)
plot(NEI_yearly$year,NEI_yearly$yearlyEmissions,type='l', xlab="Year", ylab="Total Emissions", main=expression("Total " ~ PM[2.5] ~ " Emissions in Baltimore City, Maryland, USA"))
dev.off()
