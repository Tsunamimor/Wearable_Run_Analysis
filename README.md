# Wearable_Run_Analysis
### This repository contains contain a project to demonstrate your ability to collect, work with and clean a data set.

### Repository contents:

    * /data folder containing the source material obtained from:                            https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    * A script run_analysis.R which processes this data into a tidy data set.
    * A code book that contains details of the outputted tidy data set.
    * The tidy data set file TidyAvgData.txt

### Raw data set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### The dataset contained in the /data folder includes the following files:
=========================================
   * 'README.txt'
   * 'features_info.txt': Shows information about the variables used on the feature vector.
   * 'features.txt': List of all features.
   * 'activity_labels.txt': Links the class labels with their activity name.
   * 'train/X_train.txt': Training set.
   * 'train/y_train.txt': Training labels.
   * 'test/X_test.txt': Test set.
   * 'test/y_test.txt': Test labels.  

### An R script called run_analysis.R is contained in the repository that does the following:
   * Merges the training and the test sets to create one data set.
   * Extracts only the measurements on the mean and standard deviation for each measurement.
   * Uses descriptive activity names to name the activities in the data set
   * Labels the data set with descriptive variable names.
   * From the tidy data set in step 4 above, an independent tidy data set called TidyAvgData.txt was created from the run_analysis.R script (using the raw data in /data),  with the average of each variable for each activity and each subject.
   * More details on TidyAvgData.txt can be found in the codebook run_analysis_Codebook.txt
