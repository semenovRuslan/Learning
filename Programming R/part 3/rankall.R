rankall <- function(outcome, num = "best") {
	## Read outcome data
	outData<-read.csv("outcome-of-care-measures.csv", na.strings="Not Available")
	statesAll<-levels(factor(outData$State))
	retState<-character(0)
	retHospt<-character(0)

	## Check that state and outcome are valid
	if (outcome=="heart attack"){
		nomField<-11
	}
	else if (outcome=="heart failure"){
		nomField<-17
	}
	else if (outcome=="pneumonia"){
		nomField<-23
	}
	else { stop("invalid outcome")
	}	

	if(is.numeric(num)){
		nomRank<-num
	}
	else if (num =="best"){
		nomRank<-1
	}
	else if (num=="worst"){
		nomRank<- -1
	}
	else { stop("invalid rank")
	}


	## For each state, find the hospital of the given rank
	for(i in seq_along(statesAll)){
		retSet<-subset(outData, outData$State==statesAll[i])
		if (num=="worst"){
			bad<-is.na(retSet[, nomField])
			nomRank<-length(retSet[, nomField][!bad])
		}
		retState<-c(retState, statesAll[i])
		retHospt<-c(retHospt, as.character(retSet[, 2][order(retSet[,nomField], retSet[,2])][nomRank] ))
	}	
	
	## Return a data frame with the hospital names and the
	## (abbreviated) state name
	retDS<-data.frame(retHospt, retState)
	colnames(retDS)<-c('hospital','state')
	retDS
}