> system.time(readLines("http://www.armorgames.com"))
   user  system elapsed 
   0.89    0.19    4.79 

> hilbert <- function(n)
+ {
+     i <- 1:n
+     1 / outer(i -1, i, "+")
+ }
> x <- hilbert(1000)
> system.time(svd(x))
   user  system elapsed 
   6.10    0.05    6.49 
