Exploration
========================================================

Obtain data from https://spark-public.s3.amazonaws.com/dataanalysis/loansData.csv


```r
url <- "https://spark-public.s3.amazonaws.com/dataanalysis/loansData.csv"
loansFile = "loansData.csv"
# download.file(url, loansFile, method='curl')
```


Load csv into data.frame.


```r
loans <- read.csv(loansFile)
```

