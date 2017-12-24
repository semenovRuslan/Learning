best <- function(state, outcome) {
	## Read outcome data
	outData<-read.csv("outcome-of-care-measures.csv", na.strings="Not Available")

	## Check that state and outcome are valid
	retSet<-subset(outData, outData$State==state)
	
	if (nrow(retSet)==0) stop("invalid state")

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
		
	bestReslt<-min(as.numeric(retSet[,nomField]), na.rm=TRUE)
	retSet = subset(retSet, as.numeric(retSet[,nomField])==bestReslt)
	
	## Return hospital name in that state with lowest 30-day death rate
	as.character(retSet[,2][order(retSet[,2])][1])
	#retSet
}