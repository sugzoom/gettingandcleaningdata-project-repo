gettingandcleaningdata-project-repo
===================================

Repo for project for Getting and Cleaning Data Coursera Course

The details of the actions performed on the original data may be traced via the comments found in the file run_analysis.R

At a high level, the tasks performed in the analysis were as follows:
1. Loaded the data into R
2. Created descriptive column names for test, training, activities and features
3. Merged all data into a single data frame
4. Matched the appropriate activity names with the corresponding activity labels
5. Identified "mean" and "sd" variables
6. Subsetted the data to include only activity names, subject labels and variables identified in step 5
7. Calculated averages, by levels of activity and subject, over variables subset in step 6
8. Wrote the results obtained in step 7 to flat file


Variables in tidydata.txt can be divided into two general groups:
FACTORS:
(These variables contain the labels that identify each observation)
"activity_names" - the names of the activities, e.g. "WALKING"
"subject_labels" - the labels identifying each subject


AVERAGES OF "mean" AND "sd" VARIABLES:
(These variables correspond to the simple arithmetic mean, by unique combinations of "activity_names" and "subject_labels", of each variable from the original UCI HAR data sets. Each varible is named after the UCI HAR variable for which it represents)
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-Y"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-Y"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-Y"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-Y"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-Y"
"tBodyAccMag-mean()"
"tGravityAccMag-mean()"
"tBodyAccJerkMag-mean()"
"tBodyGyroMag-mean()"
"tBodyGyroJerkMag-mean()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-Y"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-Y"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-Y"
"fBodyAccMag-mean()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroJerkMag-mean()"
"tBodyAcc-mean()-Y"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-Y"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-Y"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-std()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-Y"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-Y"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Z"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-std()"
 