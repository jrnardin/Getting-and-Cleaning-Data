# Week 4 Assignment

#read in all of the tables
#used this in live assessment of data dimensions & content

library(plyr)
#read in all of the tables required for assignment
#left out the Inertial Signals data because it seemed unnecessary for this assignment
xtrain <- read.table("X_train.txt")
xtest <- read.table("X_test.txt")
ytrain <- read.table("y_train.txt")
ytest <- read.table("y_test.txt")
stest <- read.table("subject_test.txt")
strain <- read.table("subject_train.txt")
features <- read.delim("features.txt", header=FALSE, sep="")
#used this in live assessment of data dimensions & content

#label the columns of the TEST and TRAIN sets; all get same labels
stest <- setNames(object=stest, "Subject")
ytest <- setNames(object = ytest, "Labels")
xtest <- setNames(object=xtest, features$V2)

strain <- setNames(object=strain, "Subject")
ytrain <- setNames(object = ytrain, "Labels")
xtrain <- setNames(object=xtrain, features$V2)

##STEP 1: Merge the data sets
      #I start by emrging the test sets together, then do the same for the train sets
      #this maintains the order & subsequent data integrity

#merge the TEST sets together
temptest <- cbind(ytest, xtest)
newtest <- cbind(stest, temptest)

#merge the TRAIN sets together
temptrain <- cbind(ytrain, xtrain)
newtrain <- cbind(strain, temptrain)

#put the TEST and TRAIN datasets together
CompleteDataSet <- rbind(newtrain, newtest)

##STEP 2: Extracts the mean and standard deviation for each measurement.
      #Create new Dataframe with subset of data 
      #includes measurements of the mean and standard deviation
      #does not include measurements based on Mean as input to a function
      #this reduced dataset by 7 columns/fields of data (the 7 "angle" fields)
MeanStdSubset <- subset(CompleteDataSet, 
                        select=c(1,2,
                                grep("[sS]td", names(CompleteDataSet)),
                                grep("-[mM]ean", names(CompleteDataSet))))

##STEP 3: Uses descriptive activity names to name the activities in the data set
      #populate the "Labels" field with descriptive labels for activities 
      #instead of numbers used the data in "activity_labels.txt" file as mapping table
MeanStdSubset$Labels <- factor(MeanStdSubset$Labels, 
                          levels = c(1, 2, 3, 4, 5, 6),
                          labels = c("walking", "Walking_Upstairs", "Walking_Downstairs",
                                     "sitting", "Standing", "Laying"))

##STEP 4: Appropriately labels the data set with descriptive variable names.
      # a rather long method method; pretty sure this could be optimized with time
      # Most variables have 6 parts:
      # 1. Whether the calculation is a Mean or Standard Deviation (StdDev)
      # 2. Whether the calculation is on the X, Y, Z axis or on the magnitude 
            # magnitude derived from the three-dimensional signals using the Euclidean norm
      # 3. Whether it is motion from the Body or from Gravity
      # 4. Whether it was recorded from the accelerometer or from the gyroscope
      # 5. If it was canculated as a jerk motion (linear acceleration and angular velocity were derived in time)
      # 6. Whether the values are from the time or frequency domain signals

colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-mean()-X"] <- "Mean_of_X_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-mean()-Y"] <- "Mean_of_Y_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-mean()-Z"] <- "Mean_of_Z_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-meanFreq()-X"] <- "MeanFreq_of_X_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-meanFreq()-Y"] <- "MeanFreq_of_Y_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-meanFreq()-Z"] <- "MeanFreq_of_Z_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-std()-X"] <- "StdDev_of_X_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-std()-Y"] <- "StdDev_of_Y_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccJerk-std()-Z"] <- "StdDev_of_Z_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyAccJerkMag-mean()"] <- "Mean_of_Magnitude_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyAccJerkMag-meanFreq()"] <- "MeanFreq_of_Magnitude_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyAccJerkMag-std()"] <- "StdDev_of_Magnitude_from_Body_Accelerometer_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyGyroJerkMag-mean()"] <- "Mean_of_Magnitude_from_Body_Gyroscope_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyGyroJerkMag-meanFreq()"] <- "MeanFreq_of_Magnitude_from_Body_Gyroscope_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyGyroJerkMag-std()"] <- "StdDev_of_Magnitude_from_Body_Gyroscope_Jerk_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerk-mean()-X"] <- "Mean_of_X_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerk-mean()-Y"] <- "Mean_of_Y_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerk-mean()-Z"] <- "Mean_of_Z_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerk-std()-X"] <- "StdDev_of_X_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerk-std()-Y"] <- "StdDev_of_Y_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerk-std()-Z"] <- "StdDev_of_Z_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerkMag-mean()"] <- "Mean_of_Magnitude_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccJerkMag-std()"] <- "StdDev_of_Magnitude_from_Body_Accelerometer_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerk-mean()-X"] <- "Mean_of_X_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerk-mean()-Y"] <- "Mean_of_Y_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerk-mean()-Z"] <- "Mean_of_Z_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerk-std()-X"] <- "StdDev_of_X_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerk-std()-Y"] <- "StdDev_of_Y_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerk-std()-Z"] <- "StdDev_of_Z_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerkMag-mean()"] <- "Mean_of_Magnitude_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroJerkMag-std()"] <- "StdDev_of_Magnitude_from_Body_Gyroscope_Jerk_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "Labels"] <- "Activity_Measured"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "Subject"] <- "ID_Num_of_Subject"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-mean()-X"] <- "Mean_of_X_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-mean()-Y"] <- "Mean_of_Y_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-mean()-Z"] <- "Mean_of_Z_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-meanFreq()-X"] <- "MeanFreq_of_X_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-meanFreq()-Y"] <- "MeanFreq_of_Y_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-meanFreq()-Z"] <- "MeanFreq_of_Z_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-std()-X"] <- "StdDev_of_X_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-std()-Y"] <- "StdDev_of_Y_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAcc-std()-Z"] <- "StdDev_of_Z_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccMag-mean()"] <- "Mean_of_Mag_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccMag-meanFreq()"] <- "MeanFreq_of_Mag_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyAccMag-std()"] <- "StdDev_of_Mag_from_Body_Accelerometer_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyGyroMag-mean()"] <- "Mean_of_Mag_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyGyroMag-meanFreq()"] <- "MeanFreq_of_Mag_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyBodyGyroMag-std()"] <- "StdDev_of_Mag_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-mean()-X"] <- "Mean_of_X_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-mean()-Y"] <- "Mean_of_Y_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-mean()-Z"] <- "Mean_of_Z_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-meanFreq()-X"] <- "MeanFreq_of_X_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-meanFreq()-Y"] <- "MeanFreq_of_Y_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-meanFreq()-Z"] <- "MeanFreq_of_Z_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-std()-X"] <- "StdDev_of_X_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-std()-Y"] <- "StdDev_of_Y_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "fBodyGyro-std()-Z"] <- "StdDev_of_Z_from_Body_Gyroscope_freq"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAcc-mean()-X"] <- "Mean_of_X_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAcc-mean()-Y"] <- "Mean_of_Y_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAcc-mean()-Z"] <- "Mean_of_Z_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAcc-std()-X"] <- "StdDev_of_X_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAcc-std()-Y"] <- "StdDev_of_Y_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAcc-std()-Z"] <- "StdDev_of_Z_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccMag-mean()"] <- "Mean_of_Mag_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyAccMag-std()"] <- "StdDev_of_Mag_from_Body_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyro-mean()-X"] <- "Mean_of_X_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyro-mean()-Y"] <- "Mean_of_Y_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyro-mean()-Z"] <- "Mean_of_Z_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyro-std()-X"] <- "StdDev_of_X_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyro-std()-Y"] <- "StdDev_of_Y_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyro-std()-Z"] <- "StdDev_of_Z_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroMag-mean()"] <- "Mean_of_Mag_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tBodyGyroMag-std()"] <- "StdDev_of_Mag_from_Body_Gyroscope_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAcc-mean()-X"] <- "Mean_of_X_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAcc-mean()-Y"] <- "Mean_of_Y_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAcc-mean()-Z"] <- "Mean_of_Z_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAcc-std()-X"] <- "StdDev_of_X_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAcc-std()-Y"] <- "StdDev_of_Y_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAcc-std()-Z"] <- "StdDev_of_Z_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAccMag-mean()"] <- "Mean_of_Magnitude_from_Gravity_Accelerometer_time"
colnames(MeanStdSubset)[colnames(MeanStdSubset) == "tGravityAccMag-std()"] <- "StdDev_of_Magnitude_from_Gravity_Accelerometer_time"


# STEP 5: creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      # feels a wee-bit long, but simply calculated the mean (aka average) for
      # every column for each subject's 6 types of activities
      # was very careful to not manipulate the data or the columns names
      # so that reassignment is aligned.


Mean_of_All <- ddply(MeanStdSubset, .(ID_Num_of_Subject, Activity_Measured), summarize, 
                     mean(StdDev_of_X_from_Body_Accelerometer_time),
                     mean(StdDev_of_Y_from_Body_Accelerometer_time),
                     mean(StdDev_of_Z_from_Body_Accelerometer_time),
                     mean(StdDev_of_X_from_Gravity_Accelerometer_time),
                     mean(StdDev_of_Y_from_Gravity_Accelerometer_time),
                     mean(StdDev_of_Z_from_Gravity_Accelerometer_time),
                     mean(StdDev_of_X_from_Body_Accelerometer_Jerk_time),
                     mean(StdDev_of_Y_from_Body_Accelerometer_Jerk_time),
                     mean(StdDev_of_Z_from_Body_Accelerometer_Jerk_time),
                     mean(StdDev_of_X_from_Body_Gyroscope_time),
                     mean(StdDev_of_Y_from_Body_Gyroscope_time),
                     mean(StdDev_of_Z_from_Body_Gyroscope_time),
                     mean(StdDev_of_X_from_Body_Gyroscope_Jerk_time),
                     mean(StdDev_of_Y_from_Body_Gyroscope_Jerk_time),
                     mean(StdDev_of_Z_from_Body_Gyroscope_Jerk_time),
                     mean(StdDev_of_Mag_from_Body_Accelerometer_time),
                     mean(StdDev_of_Magnitude_from_Gravity_Accelerometer_time),
                     mean(StdDev_of_Magnitude_from_Body_Accelerometer_Jerk_time),
                     mean(StdDev_of_Mag_from_Body_Gyroscope_time),
                     mean(StdDev_of_Magnitude_from_Body_Gyroscope_Jerk_time),
                     mean(StdDev_of_X_from_Body_Accelerometer_freq),
                     mean(StdDev_of_Y_from_Body_Accelerometer_freq),
                     mean(StdDev_of_Z_from_Body_Accelerometer_freq),
                     mean(StdDev_of_X_from_Body_Accelerometer_Jerk_freq),
                     mean(StdDev_of_Y_from_Body_Accelerometer_Jerk_freq),
                     mean(StdDev_of_Z_from_Body_Accelerometer_Jerk_freq),
                     mean(StdDev_of_X_from_Body_Gyroscope_freq),
                     mean(StdDev_of_Y_from_Body_Gyroscope_freq),
                     mean(StdDev_of_Z_from_Body_Gyroscope_freq),
                     mean(StdDev_of_Mag_from_Body_Accelerometer_freq),
                     mean(StdDev_of_Magnitude_from_Body_Accelerometer_Jerk_freq),
                     mean(StdDev_of_Mag_from_Body_Gyroscope_freq),
                     mean(StdDev_of_Magnitude_from_Body_Gyroscope_Jerk_freq),
                     mean(Mean_of_X_from_Body_Accelerometer_time),
                     mean(Mean_of_Y_from_Body_Accelerometer_time),
                     mean(Mean_of_Z_from_Body_Accelerometer_time),
                     mean(Mean_of_X_from_Gravity_Accelerometer_time),
                     mean(Mean_of_Y_from_Gravity_Accelerometer_time),
                     mean(Mean_of_Z_from_Gravity_Accelerometer_time),
                     mean(Mean_of_X_from_Body_Accelerometer_Jerk_time),
                     mean(Mean_of_Y_from_Body_Accelerometer_Jerk_time),
                     mean(Mean_of_Z_from_Body_Accelerometer_Jerk_time),
                     mean(Mean_of_X_from_Body_Gyroscope_time),
                     mean(Mean_of_Y_from_Body_Gyroscope_time),
                     mean(Mean_of_Z_from_Body_Gyroscope_time),
                     mean(Mean_of_X_from_Body_Gyroscope_Jerk_time),
                     mean(Mean_of_Y_from_Body_Gyroscope_Jerk_time),
                     mean(Mean_of_Z_from_Body_Gyroscope_Jerk_time),
                     mean(Mean_of_Mag_from_Body_Accelerometer_time),
                     mean(Mean_of_Magnitude_from_Gravity_Accelerometer_time),
                     mean(Mean_of_Magnitude_from_Body_Accelerometer_Jerk_time),
                     mean(Mean_of_Mag_from_Body_Gyroscope_time),
                     mean(Mean_of_Magnitude_from_Body_Gyroscope_Jerk_time),
                     mean(Mean_of_X_from_Body_Accelerometer_freq),
                     mean(Mean_of_Y_from_Body_Accelerometer_freq),
                     mean(Mean_of_Z_from_Body_Accelerometer_freq),
                     mean(MeanFreq_of_X_from_Body_Accelerometer_freq),
                     mean(MeanFreq_of_Y_from_Body_Accelerometer_freq),
                     mean(MeanFreq_of_Z_from_Body_Accelerometer_freq),
                     mean(Mean_of_X_from_Body_Accelerometer_Jerk_freq),
                     mean(Mean_of_Y_from_Body_Accelerometer_Jerk_freq),
                     mean(Mean_of_Z_from_Body_Accelerometer_Jerk_freq),
                     mean(MeanFreq_of_X_from_Body_Accelerometer_Jerk_freq),
                     mean(MeanFreq_of_Y_from_Body_Accelerometer_Jerk_freq),
                     mean(MeanFreq_of_Z_from_Body_Accelerometer_Jerk_freq),
                     mean(Mean_of_X_from_Body_Gyroscope_freq),
                     mean(Mean_of_Y_from_Body_Gyroscope_freq),
                     mean(Mean_of_Z_from_Body_Gyroscope_freq),
                     mean(MeanFreq_of_X_from_Body_Gyroscope_freq),
                     mean(MeanFreq_of_Y_from_Body_Gyroscope_freq),
                     mean(MeanFreq_of_Z_from_Body_Gyroscope_freq),
                     mean(Mean_of_Mag_from_Body_Accelerometer_freq),
                     mean(MeanFreq_of_Mag_from_Body_Accelerometer_freq),
                     mean(Mean_of_Magnitude_from_Body_Accelerometer_Jerk_freq),
                     mean(MeanFreq_of_Magnitude_from_Body_Accelerometer_Jerk_freq),
                     mean(Mean_of_Mag_from_Body_Gyroscope_freq),
                     mean(MeanFreq_of_Mag_from_Body_Gyroscope_freq),
                     mean(Mean_of_Magnitude_from_Body_Gyroscope_Jerk_freq),
                     mean(MeanFreq_of_Magnitude_from_Body_Gyroscope_Jerk_freq))

names(Mean_of_All) <- names(MeanStdSubset)

write.csv(Mean_of_All, "Mean_of_All_Output.csv")
write.table(Mean_of_All, file = "Mean_of_All_Output.txt", row.names = FALSE)
