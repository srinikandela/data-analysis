# tidy data: variables in columns, observations in rows, table per kind of obs
# fix variable names, create new variables, merge data sets ... 90% of effort expended munging

cameraData <- read.csv("./data/cameras.csv") 
names(cameraData)
tolower(names(cameraData))
splitNames = strsplit(names(cameraData),"\\.") 
splitNames[[5]]
splitNames[[6]]
splitNames[[6]][1]
firstElement <- function(x){x[1]} 
sapply(splitNames,firstElement)

#
fileUrl1 <- "https://dl.dropbox.com/u/7710864/data/reviews-apr29.csv"
fileUrl2 <- "https://dl.dropbox.com/u/7710864/data/solutions-apr29.csv" 
download.file(fileUrl1,destfile="./data/reviews.csv",method="curl") 
download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv") 
head(reviews,2)
head(solutions,2)
names(reviews)
sub("_","",names(reviews),)
# substitute / global sub
testName <- "this_is_a_test" 
sub("_","",testName)
gsub("_","",testName)
# grouping quantitative values
reviews$time_left[1:10]
timeRanges <- cut(reviews$time_left,seq(0,3600,by=600)) 
timeRanges[1:10]
class(timeRanges)
table(timeRanges,useNA="ifany")
#
library(Hmisc)
timeRanges<- cut2(reviews$time_left,g=6) 
table(timeRanges,useNA="ifany")
timeRanges<- cut2(reviews$time_left,g=6) 
reviews$timeRanges <- timeRanges 
head(reviews,2)
# merging
names(reviews)
names(solutions)
mergedData <- merge(reviews,solutions,all=TRUE) 
head(mergedData)

mergedData2 <- merge(reviews,solutions,by.x="solution_id",by.y="id",all=TRUE)
head(mergedData2[,1:6],3)
reviews[1,1:6]

# sorting
mergedData2$reviewer_id[1:10]
sort(mergedData2$reviewer_id[1:10])
# ordering
order(mergedData2$reviewer_id)[1:10]
mergedData2$reviewer_id[order(mergedData2$reviewer_id)]
head(mergedData2[,1:6],3)
sortedData <- mergedData2[order(mergedData2$reviewer_id),] 
head(sortedData[,1:6],3)
sortedData <- mergedData2[order(mergedData2$reviewer_id,mergedData2$id),] 
head(sortedData[,1:6],3)

# reshaping

misShaped <- as.data.frame(matrix(c(NA,5,1,4,2,3),byrow=TRUE,nrow=3)) 
names(misShaped) <- c("treatmentA","treatmentB")
misShaped$people <- c("John","Jane","Mary")
misShaped
library("reshape2")
melt(misShaped,id.vars="people",variable.name="treatment",value.name="value")











