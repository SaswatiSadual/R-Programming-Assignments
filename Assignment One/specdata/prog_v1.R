# Simulate some data:
# Create 332 data frames
set.seed(1)
df.list<-replicate(332,data.frame(sulfate=rnorm(100),nitrate=rnorm(100)),simplify=FALSE)
# Generate names like 001.csv and 010.csv
file.names<-paste0('specdata/',sprintf('%03d',1:332),'.csv')
# Write them to disk
invisible(mapply(write.csv,df.list,file.names))

##Read the data and find the mean:
pollutantmean <- function(directory, pollutant, id = 1:332) {
  file.names <- list.files(directory)
  file.numbers <- as.numeric(sub('\\.csv$','', file.names))
  selected.files <- na.omit(file.names[match(id, file.numbers)])
  selected.dfs <- lapply(file.path(directory,selected.files), read.csv)
  mean(c(sapply(selected.dfs, function(x) x[ ,pollutant])), na.rm=TRUE)
}

pollutantmean(getwd(),'nitrate',c(1:100,141))