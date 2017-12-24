complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
	nobs<-numeric(length(id))
	for(i in 1:length(id)){
   		fileName<-paste('00', id[i], sep='')
		fileName<-substr(fileName, nchar(fileName)-2, nchar(fileName))
  		puthFile<-paste(directory, fileName, sep='\\')
		puthFile<-paste(puthFile, 'csv', sep='.')

		con<-file(puthFile, "r") ##/"r"-read/"w"-write/"a"-append
		data<-read.csv(con)
		good<-complete.cases(data)
		nobs[i]<-length(good[good==TRUE])
		close(con)
		}
	##cbind(id, nobs)
	data.frame(id=id, nobs=nobs)
}
