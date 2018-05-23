# Plot1

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from
# all sources for each of the years 1999, 2002, 2005, and 2008.



# Figure out the total emmisions for a year
yearly.emmissions <- function(year) {
  return(sum(NEI$Emissions[NEI$year==year]))
}

years <- c('1999','2002','2005','2008')

total.emissions <- sapply(years,yearly.emmissions,USE.NAMES=TRUE)

barplot(total.emissions,main="Total Emissions from 1999 to 2008")

dev.copy(png,"plot1.png")
dev.off()
