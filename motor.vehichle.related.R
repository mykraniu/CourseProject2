# Figure out which sources are motor vehicle related

# Motor vehicle regexp
motor.vehicle.regexp <- '[Vv]ehicle'

id.col.names <- c('Short.Name','EI.Sector','SCC.Level.One','SCC.Level.Two','SCC.Level.Three')

# Identify the columns that have Vehicle in the name
ids <- lapply(id.col.names,function(x){grep(motor.vehicle.regexp,SCC[[x]])})
names(ids) <- id.col.names
ids[['All']] <- unique(unlist(ids))

# Find the number of entries
id.counts <- lapply(ids,length)

# Select Motor Vehicle related entries from SCC
SCC.motor.vehicle <- SCC %>% filter(grepl('Mobile .*Vehicles',EI.Sector))

# Get All rows in NEI which match Coal Related SCC using INNER join
NEI.motor.vehicle <- inner_join(NEI,SCC.motor.vehicle)


