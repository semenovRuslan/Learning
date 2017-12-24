rankhospital <- function(state, outcome, num = "best") {
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

	if(is.numeric(num)){
		nomRank<-num
	}
	else if (num =="best"){
		nomRank<-1
	}
	else if (num=="worst"){
		bad<-is.na(retSet[, nomField])
		nomRank<-length(retSet[, nomField][!bad])
	}
	else { stop("invalid rank")
	}
	#retSet
	
	## Return hospital name in that state with the given rank
	## 30-day death rate
	as.character(retSet[,2][order(retSet[,nomField], retSet[,2])][nomRank])

}