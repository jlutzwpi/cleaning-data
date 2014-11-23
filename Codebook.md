Codebook for Cleaning Data Course Project
=============

The code book is used to translate what the values mean in the data_output.txt file.

The output file can be a little overwhelming.  There are 88 columns in the output file, along with 180 rows of data.  The first two columns are the Subject and Activity.  The Subject column represents the subject (person) that performed the activity.  It is a range from 1 to 30.  The Activity column represents the activity that the person was performing.  The options here are Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying.

The remaining 86 columns represent the mean values from the data points recorded from the Samsung Galaxy S II smartphones.  These data points came from the input data files from the data set mentioned in the README.md file.

These 86 columns only include mean and standard deviation data from the data set per the Course project instructions.  To understand what the column names represent:
- If the column name is preceeded by a t, that indicates time (for time domain signals). 
- If the column name begins with a f, that indicates a frequency domain signal.
- Acc signifies acceleration, meaning the data comes from the accelerometer.  For example, tBodyAcc-mean() indicates that it is a time domain signal, measuring body acceleration, and it is a mean value.
- Gyro indicates that the data comes from the Gyroscope, for example: tBodyGyro-mean().
- X,Y,and Z are the 3 axis from which data are collected.
- The term Mag indicates the magnitude of the three dimensional signals (x,y,z) using the Euclidian norm.  
- Jerk signals (indicated by Jerk) were derived by the calculation of the body linear acceleration and angular velocity.

As previously stated, all columns in the output file are either **mean** or **standard deviation** measurements.  The row data is the mean of those values for each subject and for each activity.
