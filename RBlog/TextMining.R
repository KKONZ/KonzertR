library(tm)
library(stringi)
library(proxy)
wiki <- "http://en.wikipedia.org/wiki/"
titles <- c("Integral", "Riemann_integral", "Riemann-Stieltjes_integral", "Derivative",
            "Limit_of_a_sequence", "Edvard_Munch", "Vincent_van_Gogh", "Jan_Matejko",
            "Lev_Tolstoj", "Franz_Kafka", "J._R._R._Tolkien")
articles <- character(length(titles))

for (i in 1:length(titles)) {
        articles[i] <- stri_flatten(readLines(stri_paste(wiki, titles[i])), col = " ")
}

docs <- Corpus(VectorSource(articles))

