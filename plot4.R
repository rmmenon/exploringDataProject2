NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI_yearly <- 
  SCC %>% 
    filter(grepl("Coal", EI.Sector, ignore.case=TRUE)) %>% 
      inner_join(NEI, by=c("SCC")) %>% 
        group_by(year) %>% 
          summarize(emissions = sum(Emissions, na.rm=TRUE))

p <- qplot(year, emissions, data=NEI_yearly,geom=c("point", "smooth"), main=expression("Total Coal related " ~ PM[2.5] ~ " Emissions in US"))
ggsave(filename="plot4.png", p, width=5, height=5, dpi=100)
