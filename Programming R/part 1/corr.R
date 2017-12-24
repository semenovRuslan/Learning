corr <- function(directory, threshold = 0, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations
        ## NOTE: Do not round the result!
	allArrayData<-complete(directory)
	workData<-subset(allArrayData, nobs > threshold, select=c(id, nobs))

	corrReslt<-numeric(nrow(workData))
	if (length(corrReslt)!=0){
		for(i in 1:nrow(workData)){
	   		fileName<-paste('00', workData$id[i], sep='')
			fileName<-substr(fileName, nchar(fileName)-2, nchar(fileName))
	  		puthFile<-paste(directory, fileName, sep='\\')
			puthFile<-paste(puthFile, 'csv', sep='.')
	
			con<-file(puthFile, "r") ##/"r"-read/"w"-write/"a"-append
			data<-read.csv(con)
			dataCompl<-data[complete.cases(data),]
			corrReslt[i]<-cor(dataCompl$nitrate, dataCompl$sulfate)
			close(con)
			}
		}
	corrReslt
}
