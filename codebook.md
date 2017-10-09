---
title: "Codebook"
author: "JRNardin"
date: "10/8/2017"
output: html_document
---

This codebook provides more details about the robust dataset used for the "Getting and
Cleaning Data" final project. This document provides information about accessing
the original dataset and about the variables used to produce the final dataset, 
and about the final dataset itself.

at the bottom is the codebook provided with the original dataset, as a detailed
reference to the original

For more information on the files and *how* this data was used and transformed, please reference
the README file, also included in the repository

SOURCE DATA

The source Data can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and details are included in this file (below description of output/final file)


In the output/final data set you will find...

First column labeled "ID_Num_of_Subject" - (integer) represents a unique identifier for
      each person (aka: subject) participating in the testing activities
      
Second column labeled "Activity_Measured" - represents the various activities
      measured during the testing process. The number below was used in the 
      initial dataset (integer), but was then converted to the words (6-level factor)
      below to provide a more independently descriptive and accessible dataset
      1 = walking
      2 = Walking_Upstairs
      3 = Walking_Downstairs
      4 = sitting
      5 = Standing
      6 = Laying

The rest of the columns are "num" variables in the original and final dataset, 
but in the final dataset, all are the "mean" of the values in the original 
dataset. 

All of these variables have a 6 part name:

      1. Whether the calculation is a Mean or Standard Deviation (StdDev)
      
      2. Whether the calculation is on the X, Y, Z axis or on the magnitude 
             magnitude derived from the three-dimensional signals using the Euclidean norm
      
      3. Whether it is motion from the Body or from Gravity
      
      4. Whether it was recorded from the accelerometer or from the gyroscope
      
      5. If it was canculated as a jerk motion or not
            linear acceleration and angular velocity were derived in time
            no value inserted here, if it wasn't a "jerk motion" calculation
      
      6. Whether the values are from the time or frequency domain signals
      
as per the course instructions, I created descriptive measurement names before
the final table was created, which slightly modified the contents of the table
the new dataframe's name (and file output) are used to indicate that all
of the data in the content are calculated as a "mean"

      (*list is best viewed with very wide screen--up to 80 characters wide*)
      
      old column name    >>     new column name

fBodyAccJerk-mean()-X     >>     Mean_of_X_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-mean()-Y     >>     Mean_of_Y_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-mean()-Z     >>     Mean_of_Z_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-meanFreq()-X     >>     MeanFreq_of_X_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-meanFreq()-Y     >>     MeanFreq_of_Y_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-meanFreq()-Z     >>     MeanFreq_of_Z_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-std()-X     >>     StdDev_of_X_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-std()-Y     >>     StdDev_of_Y_from_Body_Accelerometer_Jerk_freq
fBodyAccJerk-std()-Z     >>     StdDev_of_Z_from_Body_Accelerometer_Jerk_freq
fBodyBodyAccJerkMag-mean()     >>     Mean_of_Magnitude_from_Body_Accelerometer_Jerk_freq
fBodyBodyAccJerkMag-meanFreq()     >>     MeanFreq_of_Magnitude_from_Body_Accelerometer_Jerk_freq
fBodyBodyAccJerkMag-std()     >>     StdDev_of_Magnitude_from_Body_Accelerometer_Jerk_freq
fBodyBodyGyroJerkMag-mean()     >>     Mean_of_Magnitude_from_Body_Gyroscope_Jerk_freq
fBodyBodyGyroJerkMag-meanFreq()     >>     MeanFreq_of_Magnitude_from_Body_Gyroscope_Jerk_freq
fBodyBodyGyroJerkMag-std()     >>     StdDev_of_Magnitude_from_Body_Gyroscope_Jerk_freq
tBodyAccJerk-mean()-X     >>     Mean_of_X_from_Body_Accelerometer_Jerk_time
tBodyAccJerk-mean()-Y     >>     Mean_of_Y_from_Body_Accelerometer_Jerk_time
tBodyAccJerk-mean()-Z     >>     Mean_of_Z_from_Body_Accelerometer_Jerk_time
tBodyAccJerk-std()-X     >>     StdDev_of_X_from_Body_Accelerometer_Jerk_time
tBodyAccJerk-std()-Y     >>     StdDev_of_Y_from_Body_Accelerometer_Jerk_time
tBodyAccJerk-std()-Z     >>     StdDev_of_Z_from_Body_Accelerometer_Jerk_time
tBodyAccJerkMag-mean()     >>     Mean_of_Magnitude_from_Body_Accelerometer_Jerk_time
tBodyAccJerkMag-std()     >>     StdDev_of_Magnitude_from_Body_Accelerometer_Jerk_time
tBodyGyroJerk-mean()-X     >>     Mean_of_X_from_Body_Gyroscope_Jerk_time
tBodyGyroJerk-mean()-Y     >>     Mean_of_Y_from_Body_Gyroscope_Jerk_time
tBodyGyroJerk-mean()-Z     >>     Mean_of_Z_from_Body_Gyroscope_Jerk_time
tBodyGyroJerk-std()-X     >>     StdDev_of_X_from_Body_Gyroscope_Jerk_time
tBodyGyroJerk-std()-Y     >>     StdDev_of_Y_from_Body_Gyroscope_Jerk_time
tBodyGyroJerk-std()-Z     >>     StdDev_of_Z_from_Body_Gyroscope_Jerk_time
tBodyGyroJerkMag-mean()     >>     Mean_of_Magnitude_from_Body_Gyroscope_Jerk_time
tBodyGyroJerkMag-std()     >>     StdDev_of_Magnitude_from_Body_Gyroscope_Jerk_time
fBodyAcc-mean()-X     >>     Mean_of_X_from_Body_Accelerometer_freq
fBodyAcc-mean()-Y     >>     Mean_of_Y_from_Body_Accelerometer_freq
fBodyAcc-mean()-Z     >>     Mean_of_Z_from_Body_Accelerometer_freq
fBodyAcc-meanFreq()-X     >>     MeanFreq_of_X_from_Body_Accelerometer_freq
fBodyAcc-meanFreq()-Y     >>     MeanFreq_of_Y_from_Body_Accelerometer_freq
fBodyAcc-meanFreq()-Z     >>     MeanFreq_of_Z_from_Body_Accelerometer_freq
fBodyAcc-std()-X     >>     StdDev_of_X_from_Body_Accelerometer_freq
fBodyAcc-std()-Y     >>     StdDev_of_Y_from_Body_Accelerometer_freq
fBodyAcc-std()-Z     >>     StdDev_of_Z_from_Body_Accelerometer_freq
fBodyAccMag-mean()     >>     Mean_of_Mag_from_Body_Accelerometer_freq
fBodyAccMag-meanFreq()     >>     MeanFreq_of_Mag_from_Body_Accelerometer_freq
fBodyAccMag-std()     >>     StdDev_of_Mag_from_Body_Accelerometer_freq
fBodyBodyGyroMag-mean()     >>     Mean_of_Mag_from_Body_Gyroscope_freq
fBodyBodyGyroMag-meanFreq()     >>     MeanFreq_of_Mag_from_Body_Gyroscope_freq
fBodyBodyGyroMag-std()     >>     StdDev_of_Mag_from_Body_Gyroscope_freq
fBodyGyro-mean()-X     >>     Mean_of_X_from_Body_Gyroscope_freq
fBodyGyro-mean()-Y     >>     Mean_of_Y_from_Body_Gyroscope_freq
fBodyGyro-mean()-Z     >>     Mean_of_Z_from_Body_Gyroscope_freq
fBodyGyro-meanFreq()-X     >>     MeanFreq_of_X_from_Body_Gyroscope_freq
fBodyGyro-meanFreq()-Y     >>     MeanFreq_of_Y_from_Body_Gyroscope_freq
fBodyGyro-meanFreq()-Z     >>     MeanFreq_of_Z_from_Body_Gyroscope_freq
fBodyGyro-std()-X     >>     StdDev_of_X_from_Body_Gyroscope_freq
fBodyGyro-std()-Y     >>     StdDev_of_Y_from_Body_Gyroscope_freq
fBodyGyro-std()-Z     >>     StdDev_of_Z_from_Body_Gyroscope_freq
tBodyAcc-mean()-X     >>     Mean_of_X_from_Body_Accelerometer_time
tBodyAcc-mean()-Y     >>     Mean_of_Y_from_Body_Accelerometer_time
tBodyAcc-mean()-Z     >>     Mean_of_Z_from_Body_Accelerometer_time
tBodyAcc-std()-X     >>     StdDev_of_X_from_Body_Accelerometer_time
tBodyAcc-std()-Y     >>     StdDev_of_Y_from_Body_Accelerometer_time
tBodyAcc-std()-Z     >>     StdDev_of_Z_from_Body_Accelerometer_time
tBodyAccMag-mean()     >>     Mean_of_Mag_from_Body_Accelerometer_time
tBodyAccMag-std()     >>     StdDev_of_Mag_from_Body_Accelerometer_time
tBodyGyro-mean()-X     >>     Mean_of_X_from_Body_Gyroscope_time
tBodyGyro-mean()-Y     >>     Mean_of_Y_from_Body_Gyroscope_time
tBodyGyro-mean()-Z     >>     Mean_of_Z_from_Body_Gyroscope_time
tBodyGyro-std()-X     >>     StdDev_of_X_from_Body_Gyroscope_time
tBodyGyro-std()-Y     >>     StdDev_of_Y_from_Body_Gyroscope_time
tBodyGyro-std()-Z     >>     StdDev_of_Z_from_Body_Gyroscope_time
tBodyGyroMag-mean()     >>     Mean_of_Mag_from_Body_Gyroscope_time
tBodyGyroMag-std()     >>     StdDev_of_Mag_from_Body_Gyroscope_time
tGravityAcc-mean()-X     >>     Mean_of_X_from_Gravity_Accelerometer_time
tGravityAcc-mean()-Y     >>     Mean_of_Y_from_Gravity_Accelerometer_time
tGravityAcc-mean()-Z     >>     Mean_of_Z_from_Gravity_Accelerometer_time
tGravityAcc-std()-X     >>     StdDev_of_X_from_Gravity_Accelerometer_time
tGravityAcc-std()-Y     >>     StdDev_of_Y_from_Gravity_Accelerometer_time
tGravityAcc-std()-Z     >>     StdDev_of_Z_from_Gravity_Accelerometer_time
tGravityAccMag-mean()     >>     Mean_of_Mag_from_Gravity_Accelerometer_time
tGravityAccMag-std()     >>     StdDev_of_Mag_from_Gravity_Accelerometer_time



the original column names are based on the codebook providede with the original 
dataset at(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
and copied, for reference, below:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
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
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
