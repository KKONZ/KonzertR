source("best.R")
rankhospital <- function(state, outcome, num = "best"){
        hospIndx <- 2
        stIndx <- 7
        
        outcomes <- c('heart attack', 'heart failure', 'pneumonia')    
        data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        
        if (!outcome %in% outcomes) {
                stop('invalid outcome')
        }

        
        ifelse(outcome == outcomes[1], outIndx <- 11, ifelse(outcome == outcomes[2], outIndx <- 17, outIndx <- 23))
        suppressWarnings(data[,outIndx] <- as.numeric(data[,outIndx]))
        
        dataSub <- subset(data, data[,stIndx] == state, select = c(hospIndx,outIndx))
        rowNum <- order(dataSub[,2], dataSub[,1], na.last=NA)
       
        ifelse(num == "best", rank <- 1, ifelse(num == "worst", rank <- length(rowNum), rank <- num))
        rank <- as.numeric(rank)
        dataSub[rowNum,]$Hospital.Name[rank]
}