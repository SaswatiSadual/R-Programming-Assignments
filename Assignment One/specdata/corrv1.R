

corr <- function(directory, threshold=0)
{
  source("complete.R")
  allFiles <- list.files(path = directory, full.names = TRUE)
  selectedData <- data.frame()
  correlations <- data.frame()
  threshold = complete(directory, id=1:332)
  for(i in threshold)
  {
    selectedData <- read.csv(allFiles[i], header = TRUE)
    correlation <- cor(selectData[i][ ,"sulfate"], selectData[i][ ,"nitrate"])
  }
  correlation
}

cr <- corr("specdata", 150)
##head(cr)
