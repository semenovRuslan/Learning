Test1<-function(){
	outcome<-read.csv("outcome-of-care-measures.csv")
	print(head(outcome))
	print(ncol(outcome))### nrow for row count
	print(names(outcome))
	outcome[, 11]<-as.numeric(outcome[, 11])
	## we can recive Warning about NA has introduced but it is ok
	hist(outcome[, 11])
}