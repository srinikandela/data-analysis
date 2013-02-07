pData <- read.csv("./data/population.csv")
# scatter plot
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue")
# help on graphical parameters
?par
# reduce dot size to see more clearly
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5)
# add colour to see more patterns
plot(pData$JWMNP,pData$WAGP,pch=19,col=pData$SEX,cex=0.5)
# size dots by some derived quantity (percentageMaxAge)
percentMaxAge <- pData$AGEP/max(pData$AGEP) 
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=percentMaxAge*0.5)
# overlaying plots
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5) 
lines(rep(100,dim(pData)[1]),pData$WAGP,col="grey",lwd=5) 
points(seq(0,200,length=100),seq(0,20e5,length=100),col="red",pch=19)
# numeric variables as factors (intervals)
# this plots different colour for each of five age groups
library(Hmisc)
ageGroups <- cut2(pData$AGEP,g=5) 
plot(pData$JWMNP,pData$WAGP,pch=19,col=ageGroups,cex=0.5)
# large number of points
x <- rnorm(1e5) 
y <- rnorm(1e5) 
plot(x,y,pch=19)
# can sample data instead of plotting all points
x <- rnorm(1e5)
y <- rnorm(1e5)
sampledValues <- sample(1:1e5,size=1000,replace=FALSE) 
plot(x[sampledValues],y[sampledValues],pch=19)
# or smooth scatter
x <- rnorm(1e5)
y <- rnorm(1e5) 
smoothScatter(x,y)
# or hexbin
library(hexbin)
x <- rnorm(1e5)
y <- rnorm(1e5) 
hbo <- hexbin(x,y) 
plot(hbo)
# plots quantiles of x and y
x <- rnorm(20); 
y <- rnorm(20) 
qqplot(x,y)
abline(c(0,1))
# plot each column of a matrix as a line
X <- matrix(rnorm(20*5),nrow=20) 
matplot(X,type="b")
# heatmaps
image(1:10,161:236,as.matrix(pData[1:10,161:236]))
# brighter colour -> higher value
newMatrix <- as.matrix(pData[1:10,161:236]) 
newMatrix <- t(newMatrix)[,nrow(newMatrix):1] 
image(161:236, 1:10, newMatrix)
# maps
library(maps)
map("world")
lat <- runif(40,-180,180); lon <- runif(40,-90,90) 
points(lat,lon,col="blue",pch=19)
# missing values
x <- c(NA,NA,NA,4,5,6,7,8,9,10)
y <- 1:10 
plot(x,y,pch=19,xlim=c(0,11),ylim=c(0,11))

x <- rnorm(100)
y <- rnorm(100) 
y[x<0]<-NA 
boxplot(x ~ is.na(y))

http://gallery.r-enthusiasts.com

# axis labels
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5, xlab="Travel time (min)",ylab="Last 12 month wages (dollars)")

plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,
     xlab="Travel time (min)",ylab="Last 12 month wages (dollars)",cex.lab=2,cex.axis=1.5)
# legends
plot(pData$JWMNP,pData$WAGP,pch=19,col="blue",cex=0.5,xlab="TT (min)",ylab="Wages (dollars)") 
legend(100,200000,legend="All surveyed",col="blue",pch=19,cex=0.5)

plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="TT (min)",ylab="Wages (dollars)",col=pData$SEX) 
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
# titles
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",
     ylab="Wages (dollars)",col=pData$SEX,main="Wages earned versus commute time")
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
# multiple panels
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="") 
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX) 
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5))
# adding text
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX) 
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5)) 
mtext(text="(b)",side=3,line=1)

# save pdf
pdf(file="twoPanel.pdf",height=4,width=8)
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX) 
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5)) 
mtext(text="(b)",side=3,line=1)
￼￼￼dev.off()

# save png
png(file="twoPanel.pdf",height=4,width=8)
par(mfrow=c(1,2))
hist(pData$JWMNP,xlab="CT (min)",col="blue",breaks=100,main="")
mtext(text="(a)",side=3,line=1)
plot(pData$JWMNP,pData$WAGP,pch=19,cex=0.5,xlab="CT (min)",ylab="Wages (dollars)",col=pData$SEX) 
legend(100,200000,legend=c("men","women"),col=c("black","red"),pch=c(19,19),cex=c(0.5,0.5)) 
mtext(text="(b)",side=3,line=1)
￼￼￼dev.off()


http://www.biostat.wisc.edu/~kbroman/topten_worstgraphs/

# hierarchical clustering
set.seed(1234); par(mar=c(0,0,0,0))
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2) 
plot(x,y,col="blue",pch=19,cex=2) 
text(x+0.05,y+0.05,labels=as.character(1:12))

dataFrame <- data.frame(x=x,y=y) 
dist(dataFrame)
?dist

dataFrame <- data.frame(x=x,y=y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)

myplclust <- function( hclust, lab=hclust$labels, lab.col=rep(1,length(hclust$labels)), hang=0.1, ... ) {
  ## modifiction of plclust for plotting hclust objects *in colour*!
  ## Copyright Eva KF Chan 2009
  ## Arguments:
  ## hclust: hclust object
  ## lab: a character vector of labels of the leaves of the tree
  ## lab.col: colour for the labels; NA=default device foreground colour
  ## hang: as in hclust & plclust
  ## Side effect:
  ## A display of hierarchical cluster with coloured leaf labels
  y <- rep(hclust$height,2); x <- as.numeric(hclust$merge)
  y <- y[which(x<0)]; x <- x[which(x<0)]; x <- abs(x)
  y <- y[order(x)]; x <- x[order(x)]
  plot(hclust, labels=FALSE, hang=hang, ...)
  text(x=x, y=y[hclust$order]-(max(hclust$height)*hang),
       labels=lab[hclust$order], col=lab.col[hclust$order],
       srt=90, adj=c(1,0.5), xpd=NA, ... )
}

set.seed(1234)
x <- rnorm(12,mean=rep(1:3,each=4),sd=0.2)
y <- rnorm(12,mean=rep(c(1,2,1),each=4),sd=0.2)
dataFrame <- data.frame(x=x,y=y)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
myplclust(hClustering,lab=rep(1:3,each=4),lab.col=rep(1:3,each=4))


# heatmap

dataFrame <- data.frame(x=x,y=y)
set.seed(143)
dataMatrix <- as.matrix(dataFrame)[sample(1:12),]
heatmap(dataMatrix)




















