pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  files <- list.files(path = directory, full.names = TRUE)
  selected_Data <- data.frame()
  for (i in id) {
    selected_Data <- rbind(selected_Data, read.csv(files[i]))
  }
  if (pollutant == 'sulfate') {
    mean(selected_Data$sulfate, na.rm = TRUE)
  } else if (pollutant == 'nitrate') {
    mean(selected_Data$nitrate, na.rm = TRUE)
  }
  
}

pollutantmean("specdata", "nitrate", 23)