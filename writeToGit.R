library(dplyr)
library(dbplyr)
library(DBI)
library(RSQLite)
rm(list = ls())

# Just a simple program to check my Repository connection

dat <- dbConnect(SQLite(), "testRepoDat.DB")
myData <- data.frame(Numbers = 1:10, Letters = letters[1:10])
myData %>%
  dbWriteTable(dat, "myData", .)

tbl(dat, "myData") %>%
  data.frame() %>%
  head()

dbDisconnect(dat) 
rm(dat, myData)
