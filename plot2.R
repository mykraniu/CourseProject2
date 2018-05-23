# Plot2

# Have total emissions from PM2.5 decreased in the Baltimore City,
# Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

library(dplyr)

# Filter Emmisions to Emmissions in Baltimore City

NEI.24510 <- NEI %>% filter(fips=="24510")

# Figure out the total emmisions for a year
yearly.emmissions <- function(year) {
  return(sum(NEI.24510$Emissions[NEI.24510$year==year]))
}

years <- c('1999','2002','2005','2008')

total.emissions <- sapply(years,yearly.emmissions,USE.NAMES=TRUE)

barplot(total.emissions,main="Total Emissions in Baltimore City, Maryland, from 1999 to 2008")

dev.copy(png,"plot2.png")
dev.off()
