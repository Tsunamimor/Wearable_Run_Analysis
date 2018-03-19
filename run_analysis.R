## Getting and Cleaning data Project
## You should create one R script called run_analysis.R that does the following.

## 1. Merges the training and the test sets to create one data set.


## Load packages
        library(data.table)
        setwd("C:/Users/paddy/Documents/Coursera/Data Science/Course Material/3. Getting and Cleaning Data/Assignments/Project/run_analysis")

## Setup data folder
        if (!file.exists("data")) {
                dir.create("data")
        }

## Download raw data
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "./data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
        dateDownloaded <- date()
        dateDownloaded
        list.files("./data")
## Extract the data
        unzip(zipfile = "./data/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",exdir="./data")
                list.files("./data")
## See what files are in the extracted data
        list.files("./data/UCI HAR Dataset/")
        list.dirs("./data/UCI HAR Dataset/")

## Load the test data
        X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
                ## Load test set
        y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
                ## Load test labels
        subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
                ## Load subject_test data
                ## Each row identifies the subject who performed the activity 
                ## for each window sample. Its range is from 1 to 30.
        ## Check test data structure
                nrow(X_test)
                ncol(X_test)
                ncol(y_test)
                nrow(y_test)
                ncol(subject_test)
                nrow(subject_test)
## Load the train data
        X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
                ## Load train set
        y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
                ## Load train labels        
        subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
                ## Load subject_test data
                ## Each row identifies the subject who performed the activity 
                ## for each window sample. Its range is from 1 to 30.
        ## Check train data structure
                nrow(X_train)
                ncol(X_train)
                ncol(y_train)
                nrow(y_train)
                ncol(subject_train)
                nrow(subject_train)
##Merge the test data
        All_test <- cbind(subject_test, y_test, X_test)
        head(All_test)
##Merge the train data
        All_train <- cbind(subject_train, y_train, X_train)
##Merge the train and test data        
        All_Data <- rbind(All_train, All_test) 
        head(All_Data)[,1:5]
        dim(All_Data)
        ## nrow(All_Data)
        ## ncol(All_Data)
        class(All_Data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
        ## Organise the feature labels
                ## load list of all features into R
                featureList <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
                View(featureList)
                featuresWanted <- grep("mean\\(\\)|std\\(\\)", featureList[,2])
                ## used to see what the data looks like and then only extract the ones containing
                ## mean or std in their name from the 2nd column
                ## This will also be used to select the relevant columns from the x_text and x_train files
                featureList[featuresWanted,2]
                ## check the generated list of column names
        
        ## Selected data
                colSelect<-c(1,2,featuresWanted+2)
                class(colSelect)
                SelectData <-All_Data[,c(colSelect)]
                ## All_Data[1:4,c(1,2,3)]
                ## class(All_Data)
                ## as.data.frame(All_Data)
                SelectData <- All_Data[,c(1,2,featuresWanted+2)]
        ## Rename the columns of the dataset 
                colnames(SelectData) <- c("UserNumberID", "activity", featureList[featuresWanted,2])
                # Check the first few columns to see if the names are applied
                SelectData[1:5,1:10]

## 3. Uses descriptive activity names to name the activities in the data set
        ## List the activity labels        
                activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
                colnames(activity_labels)<-c("activity_id","activity")
                head(activity_labels)
        
        ## Apply these activity labels to column 2 of the SelectData table to make it more descriptive
                SelectData$activity <- activity_labels$activity[match(SelectData$activity, activity_labels$activity_id)]
                # Check the first few rows to see if the column values are replaced
                SelectData[1:20,1:4]



## 4. Appropriately labels the data set with descriptive variable names.        
        ## Check the labels of the dataset column names 
        colnames(SelectData)
        ## Replace 
        colnames(SelectData) <- gsub("\\()", "", colnames(SelectData))                
        colnames(SelectData) <- gsub("^t", "Time_", colnames(SelectData))
        colnames(SelectData) <- gsub("^f", "Frequency_", colnames(SelectData))
        colnames(SelectData) <- gsub("-mean", "_Mean", colnames(SelectData))
        colnames(SelectData) <- gsub("-std", "_StandardDev", colnames(SelectData))
        colnames(SelectData)
## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.
        library(dplyr)
        AvgUserActData <- SelectData %>%
                group_by(UserNumberID, activity) %>%
                summarise_all(funs(mean))  

        ## Write to file
        write.table(AvgUserActData, "./TidyAvgData.txt", row.names = FALSE)
        ## Check f;ile was generated
        list.files("./")