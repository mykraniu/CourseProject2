# Plot3

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make
# a plot answer this question.

library(dplyr)
library(ggplot2)

# Filter Emmisions to Emmissions in Baltimore City
NEI.24510 <- NEI %>%
  filter(fips=="24510")

# Make a plot
g <- ggplot(data=NEI.24510,aes(x=year,y=Emissions))

g + geom_bar(stat="sum") +
  facet_grid(.~type) +
  labs(title="Emmissions in Baltimore City by type from 1999-2008",x="Year") +
  theme(legend.position="none")

ggsave("plot3.png",device="png")
