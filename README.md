---
title: "README"
author: "JRNardin"
date: "10/8/2017"
output: html_document
---

Project Description

This R script performs 5 basic functions
      reads in data provided by Samsung (details provided below)
      merges 2 sets of data
      creats a subset of that data with just measuremants on Mean and standard deviation
      attaches descriptive names for the activities described in each row of data
      creates descriptive names for each of the measurements in each column of data
      creates a summary of the data by calculating the mean of each measurement (column)
            for each activity type for each person performing the activity

additional package used: plyr 

READING FILES
      used the read.table function
      took the time to label the columns in each dataset for ease of reference
      
MERGE DATA SETS
      used cbind to bind each of the individual data sets together: the 3 "test"
            data sets into 1, then the 3 "train" data sets into 1.
      use rbind function to combine the two large data sets into a single dataset
      
EXTRACT MEAN & STANDARD DEVIATION
      used the subset function to pull apart the data
      and used 2 grep function calls to parse out the "mean"" and "std" character
            sets which labeled the desired columns
      this process does not include measurements based on Mean as input to a function
            which reduced dataset by 7 columns/fields of data (the 7 "angle" fields)
            
DESCRIPTIVE ACTIVITY NAMES
      used the "factor" function to convert the activity codes into activity names
      1 = walking
      2 = Walking_Upstairs
      3 = Walking_Downstairs
      4 = sitting
      5 = Standing
      6 = Laying

DESCRIPTIVE MEASUREMENT NAMES (columns)  (*More details about the column names can be found in the CodeBook*)

      first two column labeled "ID_Num_of_Subject"" and "Activity_Measured"
      
      The rest of the columns have a 6 part name:
      
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
     

SUMMARY OF THE DATA      
      to achieve a tidy data set in the end, I used the "ddply" function 
            from the plyr package to split the data frame, 
            apply the mean function on all remaining columns
            and return a new dataframe.
      
I opted for a final, tidy data set that mirrored the previous datasets (instead 
of transposing the data) so that the user/reader would be able to easily map 
data between the common files, if analysis or any sort of  additional work is 
to be done on the data. 
      
Based on the fields chosen & functionality above, this resulted in the tranformation
            of the bulky 10299x563 dataset being summarized into just 180x81 dataset
        
## FILES CREATED
5 files included in this repository

      README - describes the functionality of the R script "run_analysis" and 
            describes the files used for this project, both the files I created
            and the sources files downloaded from the public domain

      codebook.md - describes the variables in the dataset

      run_analysis.R - the actual algorithm/script that manipulates the data; I 
            believe you will find this well documented & easy to real

      week4 assignment labeling.xlxs - an extra (not required) file that I used
            to create the 81 variable names and the function calls that use those
            variable names

      Mean_of_All_Output.txt - a tidy data set that is the final output of the work
            describedd here & in the associated files.

## SOURCE FILES
source files can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

as per the source README file: "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.""


Key files used for this project include
      README.txt file used as summary of all files downloaded in the .zip
      features.txt & features_info.txt files were used to interpret the 561 
            columns of data, and to rename the data to be a bit more readable
      Train data set: 
            y_train.txt (7352x1): list of activities performed by each subject
            subject_train.txt (7352x1): list of subjects' unqiue ID number
            X_train.txt (7352x561): data observed (561 columns) for 
                        every activity type performed by each subject (7352 rows)
      Test data set
            y_test.txt (2947x1):  list of activities performed by each subject
            subject_test.txt (2947x1): list of subjects' unqiue ID number
            X_test.txt (2947x561): data observed (561 columns) for 
                        every activity type performed by each subject (2947 rows)
