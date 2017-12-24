pollutantmean <- function(directory, pollutant, id = 1:332) {
      ## 'directory' is a character vector of length 1 indicating
      ## the location of the CSV files
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!

	subSetVal<-numeric(0)
	for(i in 1:length(id)){
   		fileName<-paste('00', id[i], sep='')
		fileName<-substr(fileName, nchar(fileName)-2, nchar(fileName))
  		puthFile<-paste(directory, fileName, sep='\\')
		puthFile<-paste(puthFile, 'csv', sep='.')

		con<-file(puthFile, "r") ##/"r"-read/"w"-write/"a"-append
		data<-read.csv(con)
		newData<-data[!is.na(data[, pollutant]), pollutant]
		subSetVal<-c(subSetVal, newData)
		close(con)
		}
	mean(subSetVal)
}
