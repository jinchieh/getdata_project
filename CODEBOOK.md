---
title: "CODEBOOK"
output: markdown
---

## THE DATA

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## THE VARIABLES

The following variable measurements are available in the dataset:
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

These measurements have an accompanying subject (30 subjects, identified by index) and activity (6 activities - Walking, Walking upstairs, Walking downstairs, Sitting, Standing and Laying). The measurements are represented by numeric values. The subjects and activities are represented by factor values. 

## THE TRANSFORMATIONS ON DATA:

The script run_analysis.R will run in R, and creates two datasets, myData & myData2. myData contains all the measurements that are means and standard deviations, for every subject and every activity. Each subject and activity can have multiple values for the same measurement.

To create myData, information about each measurement are combined to let provide information about the subject and activity. Each subject repeats each activity for several times. After that, only measurements that are means and standard deviations are subsetted to constitute myData.

myData2 takes the values for each measurement in myData, and averages them based on each unique subject and activity using the aggregate function. In this dataset, each subject-activity combination only has 1 value for each measurement. 

The resulting datasets myData & myData2 are both wide datasets.


