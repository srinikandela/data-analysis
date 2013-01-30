# q1
# wrong: analysis should be reported in a reproducible manner
# convey the story
# q2
library(XML)
con = url("http://simplystatistics.tumblr.com/")
htmlCode = readLines(con, n = 150)
close(con)
lapply(htmlCode, nchar)[c(2,45,122)] # 918, 5, 24
# q3
docUrl <- "https://dl.dropbox.com/u/7710864/data/PUMSDataDict06.pdf"
download.file(docUrl,destfile="housing.pdf",method="curl")
fileUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06hid.csv"
download.file(fileUrl,destfile="./data/housing.csv",method="curl")
housingData <- read.csv("./data/housing.csv")
head(housingData)
names(housingData)
?sum
sum(housingData$VAL == 24, na.rm = TRUE) # 53
# q4
housingData$FES # tidy data has one variable per column
# q5
query <- function(bds,rms) {
  sum(housingData$BDS == bds & housingData$RMS == rms, na.rm = TRUE)
}
query(3,4);query(2,5);query(2,7) # 148, 386, 49
# q6
agricultureLogical <- housingData$ACR == 3 & housingData$AGS == 6
which(agricultureLogical)[1:3] # 125,238,262
# q7
indexes <- which(agricultureLogical)
subsetDataFrame <- housingData[indexes,]
sum(is.na(subsetDataFrame$MRGX)) # 8
# q8
ncol(housingData)
names(housingData)
strsplit(names(housingData),"wgtp")[123] # "" "15"
# q9
quantile(housingData$YBL,na.rm=TRUE) # -1, 25, something wrong
# q10
popUrl <- "https://dl.dropbox.com/u/7710864/data/csv_hid/ss06pid.csv"
download.file(popUrl,destfile="./data/population.csv",method="curl")
populationData <- read.csv("./data/population.csv")
head(populationData)
mergedData <- merge(housingData,populationData,by.x="SERIALNO",by.y="SERIALNO",all=TRUE)
dim(mergedData) 
mergedData <- merge(housingData,populationData)
  # 15421,426




