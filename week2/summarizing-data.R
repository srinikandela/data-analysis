# look for: 
# missing values / out of range / incorrect units / mislabling / variable class
fileUrl <- "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt" 
download.file(fileUrl,destfile="./data/earthquakeData.csv",method="curl")
# important to record when download was performed
dateDownloaded <- date()
dateDownloaded
eData <- read.csv("./data/earthquakeData.csv")
# rows and cols
dim(eData)
names(eData)
nrow(eData)
# e.g. 75% of values are below x
quantile(eData$Lat)
# summarizes quantitative and qualitative variables
summary(eData)
# how is the data represented?
class(eData)
sapply(eData[1,],class)
# exploring values
unique(eData$Src)
length(unique(eData$Src))
table(eData$Src)
table(eData$Src,eData$Version)
eData$Lat[1:10]
eData$Lat[1:10] > 40
any(eData$Lat[1:10] > 40)
all(eData$Lat[1:10] > 40)
# subsetting
eData[eData$Lat > 0 & eData$Lon > 0, c("Lat", "Lon")]
eData[eData$Lat > 0 | eData$Lon > 0, c("Lat", "Lon")]

#
fileUrl1 <- "https://dl.dropbox.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropbox.com/u/7710864/data/solutions-apr29.csv"
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl") 
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv"); solutions <- read.csv("./data/solutions.csv") 
head(reviews,2)
head(solutions,2)
# missing values?
is.na(reviews$time_left[1:10])
sum(is.na(reviews$time_left))
table(is.na(reviews$time_left))
# count na values
table(c(0,1,2,3,NA,3,3,2,2,3),useNA="ifany")
# summarize quantative cols, rows
colSums(reviews)
colMeans(reviews, na.rm=TRUE)
rowMeans(reviews, na.rm=TRUE)




