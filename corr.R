corr <- function(directory, threshold = 0){
        
        corr <- numeric(0)
        
        for(i in 1:332){
                
                Files <- paste(directory,"/", sprintf("%03d.csv", i), sep="")
                
                readList <- na.omit(read.csv(Files))
                
                if (nrow(readList) >= threshold){
                        
                        cr <- cor(readList["sulfate"], readList["nitrate"])
                        
                        
                        if (!is.na(cr)){
                                corr <- append(corr, cr)
                        }
                }
                
        }
        corr
}
