library(dplyr)

####### GETTING DATA 

### Outside data (skip it if you already have the data)

#fURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#foldername <- './getdata_projectfiles_UCI HAR Dataset.zip'
#download.file(fURL,destfile= foldername)
#unzip(zipfile="./getdata_projectfiles_UCI HAR Dataset.zip",exdir="./getdata_projectfiles_UCI HAR Dataset")

### Bring data to work environment 
# Train data
subjtrain <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt')
feattrain <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt')
acttrain <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt')

# Test data
subjtest <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt')
feattest <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt')
acttest <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt')

# Variable names (common to both subsets)
feat <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt')
actname <- read.table('./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt')

### TIDYING UP (not like Marie Kondo)
names(subjtrain) <- 'subjectid'
names(subjtest)  <- 'subjectid'
names(acttrain) <- 'activityid'
names(acttest)  <- 'activityid'
names(feattest)  <- tolower(feat$V2)
names(feattrain) <- tolower(feat$V2)
names(actname) <- c('activityid','activity')

## Puzzle assembly
ctrain <- cbind(subjtrain,acttrain, feattrain) 
ctest <- cbind(subjtest, acttest, feattest)
complete <- rbind(ctest, ctrain)

## Filter
# Select features to observate (Mean and Standard deviation)

selectfeature <- feat$V2  [grep("mean\\(\\)|std\\(\\)", feat$V2)]
selectcol <-  c(tolower(selectfeature), 'subjectid','activityid')

### FINAL DATASET
data  <- select(complete,all_of(selectcol))
data <- left_join(data,actname, by = 'activityid')
data <- select(data,-activityid)
tn <- names(data)
tn <- gsub('()','',tn, fixed = TRUE)
tn <- gsub('-','',tn, fixed = TRUE)
names(data) <- tn

# Cleaning work directory 
rm(actname)
rm(acttest)
rm(acttrain)
rm(feat)
rm(feattest)
rm(feattrain)
rm(subjtest)
rm(subjtrain)
rm(selectfeature)
rm(ctest)
rm(ctrain)
rm(complete)
rm(selectcol)
rm(tn)

data2 <-aggregate(. ~subjectid + activity, data, mean)

write.table(data2, "./tidyset.txt", row.names = FALSE)
