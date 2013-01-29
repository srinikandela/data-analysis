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

