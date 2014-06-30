source("rankhospital.R")
rankall <- function(outcome, num = "best"){
        hospIndx <- 2
        stIndx <- 7
        
        outcomes <- c('heart attack', 'heart failure', 'pneumonia')    
        data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        if (!outcome %in% outcomes) {
                stop('invalid outcome')
        }
        
        ifelse(outcome == outcomes[1], outIndx <- 11, ifelse(outcome == outcomes[2], outIndx <- 17, outIndx <- 23))
        suppressWarnings(data[,outIndx] <- as.numeric(data[,outIndx]))
        state <- levels(factor(data$State))
        hospital <- sapply(state, outcome=outcome, num=num, rankhospital)
        result <- data.frame(hospital, state)
        invisible(result)
}