# Figure out which sources are coal related

id.col.names <- c('Short.Name','EI.Sector','SCC.Level.One','SCC.Level.Two','SCC.Level.Three')

# Identify the columns that have Coal in the name
ids <- lapply(id.col.names,function(x){grep('[Cc]oal',SCC[[x]])})
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

