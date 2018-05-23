# Plot3

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
  
library(dplyr)
library(ggplot2)



# Select Motor Vehicle related entries from SCC
SCC.motor.vehicle <- SCC %>% filter(grepl('Mobile .*Vehicles',EI.Sector))

# Get All rows in NEI which match Coal Related SCC using INNER join
NEI.motor.vehicle <- inner_join(NEI,SCC.motor.vehicle)

NEI.mv.24510 <- NEI.motor.vehicle %>%
  filter(fips=='24510')



# Make a plot
g <- ggplot(data=NEI.mv.24510,aes(x=year,y=Emissions))

g + geom_bar(stat="sum") +
  labs(title="Emmissions from Motor Vehicle Sources \nBaltimore City (1999-2008)",x="Year") +
  theme(legend.position="none")

ggsave("plot5.png",device="png")
