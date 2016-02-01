##New File      
pm0 <- read.table("pm25_data/RD_501_88101_1999-0.txt", comment.char = "#",
                  header = FALSE, sep = "|", na.strings = "")
cnames <- readLines("pm25_data/RD_501_88101_1999-0.txt", 1)
## split cnames
cnames <- strsplit(cnames, "|", fixed = TRUE)
##assign column names
names(pm0) <- cnames[[1]]