---
title: "CodeBook for Getting and Cleaning Data Course Project"
output: html_document
---

1. **subject**  'subject'
        Numeric value between 1 and 30

2. **activity** 'activity'  
        1 'Walking'  
        2 'Walking_Upstairs'  
        3 'Walking_Downstairs'  
        4 'Siting'  
        5 'Standing'  
        6 'Laying'  

3. to 81.  A description of the variables is outlined below, as originally described
in the <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">
Human Activity Recognition Using Smartphones Data Set</a>

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>* tBodyAcc-XYZ
>* tGravityAcc-XYZ
>* tBodyAccJerk-XYZ
>* tBodyGyro-XYZ
>* tBodyGyroJerk-XYZ
>* tBodyAccMag
>* tGravityAccMag
>* tBodyAccJerkMag
>* tBodyGyroMag
>* tBodyGyroJerkMag
>* fBodyAcc-XYZ
>* fBodyAccJerk-XYZ
>* fBodyGyro-XYZ
>* fBodyAccMag
>* fBodyAccJerkMag
>* fBodyGyroMag
>* fBodyGyroJerkMag

>The set of variables that were estimated from these signals are: 
>* mean(): Mean value
>* std(): Standard deviation
>* meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Variables 3 to 81 in the tidy dataset are the average of each measurement by subject and activity.