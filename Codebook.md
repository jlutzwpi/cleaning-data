README for Cleaning Data Course Project
=============

Files included in this project:
- run_analysis.R - the code to run
- README.md - the instructions on how to run the code and the associated **Code Book**

run_analysis.R
--------------
To run this file, ensure you have the dplyr and reshape2 libraries installed:  
`install.library("dplyr")`
`install.library("reshape2")`

Once you install those libraries, the code should run without issue.  The libraries are called within the code, so you don't need to call them before you run.

**In addition, the code assumes that the input files are in the default folder created by extracted zip file (UCI HAR Dataset).  Ensure that the input files are in that folder.  The UCI HAR Dataset should be at the same level as the run_analysis.R folder.**

To execute the code, type:
`source("run_analysis.R")`
at the R prompt.  It takes about 20 seconds to run as the data sets are large.  A data_output.txt file is generated in the executable directory.  There is no output to the console.

Code Book
---------
The code book is used to translate what the values mean in the data_output.txt file.

The output file can be a little overwhelming.  There are 88 columns in the output file, along with 180 rows of data.  The first two columns are the Subject and Activity.  The Subject column represents the subject (person) that performed the activity.  It is a range from 1 to 30.  The Activity column represents the activity that the person was performing.  The options here are Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying.

The remaining 86 columns represent the mean values from the data points recorded from the Samsung Galaxy S II smartphones.  These data points came from the input data files mentioned above.

These 86 columns only include mean and standard deviation data from the data set per the Course project instructions.  To understand what the column names represent:
- If the column name is preceeded by a t, that indicates time (for time domain signals). 
- If the column name begins with a f, that indicates a frequency domain signal.
- Acc signifies acceleration, meaning the data comes from the accelerometer.  For example, tBodyAcc-mean() indicates that it is a time domain signal, measuring body acceleration, and it is a mean value.
- Gyro indicates that the data comes from the Gyroscope, for example: tBodyGyro-mean().
- X,Y,and Z are the 3 axis from which data are collected.
- The term Mag indicates the magnitude of the three dimensional signals (x,y,z) using the Euclidian norm.  
- Jerk signals (indicated by Jerk) were derived by the calculation of the body linear acceleration and angular velocity

As previously stated, all columns in the output file are either **mean** or **standard deviation** measurements.  The row data is the mean of those values for each subject and for each activity.
