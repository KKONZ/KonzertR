pollutantmean <- function(directory, pollutant, id = 1:332){
        vec<- c();
        for(i in id){
                Files <- paste(directory,"/", sprintf("%03d.csv", as.numeric(i)), sep="")
                
                readList <- read.csv(Files)
                
                x<- readList[,c(pollutant)]
                
                x <- x[!is.na(x)]
                
                vec <- c(vec,x) 
        }
        return(print(mean(vec), digits=4)) 
