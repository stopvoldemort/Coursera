
#Question 1
# Download American Community Survey 2006 microdata on housing for Idaho

setwd("/Users/StopVoldemort/Desktop/Coursera/Getting and Cleaning Data")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile="./quiz 1/data1.csv", method="curl")
x <- fread("./quiz 1/data1.csv")

# Calculate how many properties are worth $1,000,000+
# (VAL is the column, 24 is the value corresponding with $1,000,000)
sum(x$VAL==24, na.rm=TRUE)


#Question 3
# Read xlsx file from website.
setwd("/Users/StopVoldemort/Desktop/Coursera/Getting and Cleaning Data/quiz 1")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
library(xlsx)
download.file(fileURL, destfile="data3.csv", method="curl")

# Read rows 18-23 and columns 7-15
dat <- read.xlsx("data3.csv", sheetIndex=1, rowIndex=18:23, colIndex=7:15)


# Question 4
# Read xls file from website.
setwd("/Users/StopVoldemort/Desktop/Coursera/Getting and Cleaning Data/quiz 1")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
install.packages("XML")
library(XML)
download.file(fileURL, destfile="data4.xml", method="curl")
doc <- xmlTreeParse("data4.xml", useInternal=TRUE)
rootNode <- xmlRoot(doc)

# Extract zip codes into a matrix
zip <- matrix()
x <- 1
num <- xmlSize(rootNode[[1]])
for (i in 1:num) {
  y <- xmlValue(rootNode[[1]][[x]][[2]])
  zip[x] <- y
  x <- x+1
}
zip <- as.matrix(zip)

# Count number of zip codes equal to 21231
sum(zip[ ,1]==21231, na.rm=TRUE)





