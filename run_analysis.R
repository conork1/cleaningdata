## This script reads in a number of files, combines and merges them, extracts a subset of variables
## and writes it to a file in the same directory as per the requirements in the Getting & Cleaning
## Data assignment.

currDir <- getwd() ## This assumes that the script unzipped folder "UCI HAR Dataset" is in the 
##                    same folder as this current script and it is the working directory

## Input Files
testFile <- paste0(currDir,"/UCI HAR Dataset/test/X_test.txt")
testLabelsFile <- paste0(currDir,"/UCI HAR Dataset/test/y_test.txt")
testSubjectsFile <- paste0(currDir,"/UCI HAR Dataset/test/subject_test.txt")
trainFile <- paste0(currDir,"/UCI HAR Dataset/train/X_train.txt")
trainLabelsFile <- paste0(currDir,"/UCI HAR Dataset/train/y_train.txt")
trainSubjectFile <- paste0(currDir,"/UCI HAR Dataset/train/subject_train.txt")
featureLabelsFile <- paste0(currDir,"/UCI HAR Dataset/features.txt")
activityLabelsFile <- paste0(currDir,"/UCI HAR Dataset/activity_labels.txt")

## Output Files
fullDataFile <- paste0(currDir,"/full_data.txt")
summaryDataFile <- paste0(currDir,"/summary_data.txt")

install.packages("readr")
library(readr)
colWidths <- c(17,rep.int(16,559),15)

## Load all the data in from the various files in \UCI HAR Dataset\
## load the features in so they can be used to set the column names 
featuresData <- read.table(featureLabelsFile, sep = " ")
featuresVector <- as.vector(featuresData[,2])

## load in the activity labels and keys
activityLabelData <- read.table(activityLabelsFile, sep = " ")
colnames(activityLabelData) <- c("activitykey","activitydescription")

## load in the test set data
testData <- read_fwf(file = testFile,col_positions = fwf_widths(colWidths),progress = interactive())
colnames(testData) <- featuresVector

## load the the test labels
testLabelsData <- read.table(testLabelsFile)
colnames(testLabelsData) <- c("activitykey")

## load in the test subjects
testSubjectsData <- read.table(testSubjectsFile)
colnames(testSubjectsData) <- c("subjectkey")

## get only the column names for mean and std (standard deviation)
testDataNames <- colnames(testData)
meanstdindexes <- grep("mean|std",testDataNames)
testDataSubset <- tbl_df(testData[meanstdindexes])

## combine the subject and activity data tables with the test set data
install.packages("dplyr")
library(dplyr)
fulltestdata <- bind_cols(testLabelsData,testSubjectsData,testDataSubset)
fulltestdata <- left_join(fulltestdata,activityLabelData, by="activitykey")

## load in the training set data
trainData <- read_fwf(file = trainFile,col_positions = fwf_widths(colWidths),progress = interactive())
colnames(trainData) <- featuresVector

## load the the training labels
trainLabelsData <- read.table(trainLabelsFile)
trainLabelsData$activitykey <- as.numeric(trainLabelsData$activitykey)
colnames(trainLabelsData) <- c("activitykey")

## load in the train subjects
trainSubjectsData <- read.table(trainSubjectFile)
colnames(trainSubjectsData) <- c("subjectkey")

## get only the column names for mean and std (standard deviation)
trainDataNames <- colnames(trainData)
meanstdindexes <- grep("mean|std",trainDataNames)
trainDataSubset <- tbl_df(trainData[meanstdindexes])

## combine the activity subject and train set data. Then use the activity data set as a lookup to create 
## a new column with the activity descriptions
fulltraindata <- bind_cols(trainLabelsData,trainSubjectsData,trainDataSubset)
fulltraindata <- left_join(fulltraindata,activityLabelData, by="activitykey")

##Finally merge the test and train data frames
fulldata <- bind_rows(fulltraindata,fulltestdata)

## write the merged tidy data set to a comma separated file called full_data.txt
write.table(fulldata,fullDataFile,sep=",",quote=FALSE, row.names = FALSE)


## The last task is to get a summary of the data and also write that to a file summary_data.txt
fulldata <- group_by(fulldata,activitydescription,subjectkey)
summarydata <- summarise_each(fulldata, funs(mean))
write.table(summarydata,summaryDataFile,sep=",",quote=FALSE, row.names = FALSE)
