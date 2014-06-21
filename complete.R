complete <- function(directory, id = 1:332){
        df<- data.frame(id = integer(), nobs = integer())
        for(i in id){
                Files <- paste(directory,"/", sprintf("%03d.csv", as.numeric(i)), sep="")
                
                readList <- read.csv(Files)
                
                xd <-  data.frame(i = i, nobs = nrow(na.omit(readList)))
                
                df <- rbind(df, xd)
        }
        df
}
