getwd()
setwd("./week2")
# getting files from the internet
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.csv",method="curl")
list.files("./data")
# read into memory - csv
cameraData <- read.table("./data/cameras.csv")
head(cameraData)
cameraData <- read.table("./data/cameras.csv",sep=",",header=TRUE)
head(cameraData)
cameraData <- read.csv("./data/cameras.csv")
head(cameraData)
# read into memory - xlsx
library(xlsx)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/camera.xlsx",method="curl")
cameraData <- read.xlsx2("./data/camera.xlsx",sheetIndex=1)
head(cameraData)
# choose a file to read
cameraData <- read.csv(file.choose())
# file handling
con <- file("./data/cameras.csv","r")
cameraData <- read.csv(con)
close(con)
head(cameraData)
# read from web
con <- url("http://simplystatistics.org","r")
simplyStats <- readLines(con)
close(con)
head(simplyStats)
# json
library(RJSONIO)
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/camera.json",method="curl")
download.file(fileUrl,destfile="./data/camera.json") # windows
con = file("./data/camera.json")
jsonCamera = fromJSON(con)
close(con)
head(jsonCamera)
# write data
cameraData <- read.csv("./data/cameras.csv")
tmpData <- cameraData[,-1]
write.table(tmpData,file="./data/camerasModified.csv",sep=",")
cameraData2 <- read.csv("./data/camerasModified.csv")
head(cameraData2)
# save image
cameraData <- read.csv("./data/cameras.csv")
tmpData <- cameraData[,-1]
save(tmpData,cameraData,file="./data/cameras.rda")
# read image
rm(list=ls())
ls()
load("./data/cameras.rda")
# web scraping
library(XML)
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode
#html3 <- htmlTreeParse("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en", useInternalNodes=TRUE)
#xpathSApply(html3, "//title", xmlValue)




