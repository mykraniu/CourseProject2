# Plot3

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)


# Note: Check the validity of the regular expressionfor Coal since it captures charcoal as well
coal.regexp <- '[Cc]oal'

# Figure out which sources are coal related

id.col.names <- c('Short.Name','EI.Sector','SCC.Level.One','SCC.Level.Two','SCC.Level.Three')

# Identify the columns that have Coal in the name
ids <- lapply(id.col.names,function(x){grep(coal.regexp,SCC[[x]])})
names(ids) <- id.col.names
ids[['All']] <- unique(unlist(ids))

# Find the number of entries
id.counts <- lapply(ids,length)

# Select Coal related entries from SCC
SCC.coal <- SCC[ids$All,]

# Filter only Fuel Combustion sources
SCC.coal <- SCC.coal %>%
  filter(grepl('Fuel Comb',EI.Sector))

# Get All rows in NEI which match Coal Related SCC using INNER join
NEI.coal <- inner_join(NEI,SCC.coal)





# Make a plot
g <- ggplot(data=NEI.coal,aes(x=year,y=Emissions))

g + geom_bar(stat="sum") +
  labs(title="Emmissions of Coal Related Sources from 1999-2008",x="Year") +
  theme(legend.position="none")

ggsave("plot4.png",device="png")
