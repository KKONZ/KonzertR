best <- function(state, outcome) {
        ## declare variables with associated column
        hospIndx <- 2
        stIndx <- 7
        
        outcomes <- c('heart attack', 'heart failure', 'pneumonia')    
        data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        ## Check that state and outcome are valid
        if(nrow(subset(data, data[,stIndx] == state, select = State)) <= 0){
                stop("invalid state")
        }
        if (!outcome %in% outcomes) {
                stop('invalid outcome')
        }
        
        ifelse(outcome == outcomes[1], outIndx <- 11, ifelse(outcome == outcomes[2], outIndx <- 17, outIndx <- 23))
        suppressWarnings(data[,outIndx] <- as.numeric(data[,outIndx]))
        subData <- subset(data, data[,stIndx] == state, select = c(hospIndx,outIndx))
        
        rowNum <- order(subData[,2], subData[,1], na.last=NA)
        ## result
        subData[rowNum,]$Hospital.Name[1]
}