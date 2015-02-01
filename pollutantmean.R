pollutantmean <- function(directory, pollutant, id = 1:332) {
  # 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  files_list <- list.files(directory, full.names=TRUE)   # creates a list of files
  #print (files_list)
  
  tmp <- lapply(files_list[id], read.csv) # apply Read.csv to all items in the list of files 
  # print (tmp)
  output <- do.call(rbind, tmp) # Combine the data into one massive data frame using rbind
  mean(output[, pollutant], na.rm=TRUE) # Take the mean of the specific pollutant and return the value (last item)
}