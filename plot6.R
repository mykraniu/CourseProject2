# Plot3

# Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County, California (fips=="06037").
# Which city has seen greater changes over time in motor vehicle emissions?
  
library(dplyr)
library(ggplot2)



# Select Motor Vehicle related entries from SCC
SCC.motor.vehicle <- SCC %>% filter(grepl('Mobile .*Vehicles',EI.Sector))

# Get All rows in NEI which match Coal Related SCC using INNER join
NEI.motor.vehicle <- inner_join(NEI,SCC.motor.vehicle)

NEI.mv.counties <- NEI.motor.vehicle %>%
  filter(fips=='24510'|fips=='06037')

# Add county names to the Data Frame
NEI.mv.counties[NEI.mv.counties$fips=='06037','County'] <- 'Los Angeles County'
NEI.mv.counties[NEI.mv.counties$fips=='24510','County'] <- 'Baltimore City'

# Make a plot
g <- ggplot(data=NEI.mv.counties,aes(x=year,y=Emissions))

g + geom_bar(stat="sum") +
  facet_wrap(~County, scales="free") +
  labs(title="Emmissions from Motor Vehicle Sources (1999-2008)\nLos Angeles County  &  Baltimore City",x="Year") +
  theme(legend.position="none")

ggsave("plot6.png",device="png")
