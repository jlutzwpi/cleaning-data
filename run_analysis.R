# Course Project for Getting and Cleaning Data
# run_analysis.R - gets data from txt files
library(dplyr)
library(reshape2)

#read in features.txt, will be column names
feature.data <- read.table("./UCI HAR Dataset/features.txt", sep="\r", header=FALSE, col.names=c("features"))

# this is where all of the test data will be combined
data.table <- data.frame(matrix(ncol=561))
# add the features from features.txt as the column names
colnames(data.table) <- feature.data$features

#read in the training text files
train.file1 <- "./UCI HAR Dataset/train/X_train.txt"
train.file2 <- "./UCI HAR Dataset/train/Y_train.txt"
train.file3 <- "./UCI HAR Dataset/train/subject_train.txt"

#read in the test text files
test.file1 <- "./UCI HAR Dataset/test/X_test.txt"
test.file2 <- "./UCI HAR Dataset/test/Y_test.txt"
test.file3 <- "./UCI HAR Dataset/test/subject_test.txt"

#read in training files
train1data <- read.table(train.file1, header=FALSE)
colnames(train1data) <- feature.data$features

train2data <- read.table(train.file2)
train3data <- read.table(train.file3)

#print(str(train1data))
#print(dim(train2data))
#print(dim(train3data))

#combine xtrain data into main dataframe
data.table <- rbind(data.table, train1data)
#remove first row of NAs
data.table <- data.table[-1,]

#add subject train column to the data table
data.table <- cbind(data.table, train3data)
#set column name
colnames(data.table)[562] <- "Subject"

#add y_train column to the data table
data.table <- cbind(data.table, train2data)
#set column name
colnames(data.table)[563] <- "Activity"

# now add test data
test1data <- read.table(test.file1, header=FALSE)
colnames(test1data) <- feature.data$features

test2data <- read.table(test.file2)
test3data <- read.table(test.file3)

#merge the data together
test1data <- cbind(test1data, test3data)
colnames(test1data)[562] <- "Subject"
test1data <- cbind(test1data, test2data)
colnames(test1data)[563] <- "Activity"

#merge the test data into the main data table
data.table <- rbind(data.table, test1data)

# let's start manipulating the data
data.set <- tbl_df(data.table)
# part 2: only have data that has mean or std dev
data.set2 <- select(data.set, contains("mean"), contains("std"), Subject, Activity)

# part 3: change activity to be an actual word, and not a number
activities <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")
data.set2$Activity <- factor(data.set2$Activity, labels = activities)

# part 4: remove numbers from the column names (appropriate labels)
cols <- colnames(data.set2)
cols <- gsub("[0-9]* ", "", cols)
colnames(data.set2) <- cols

# part 5: create a second data set with average for each variable for each activity 
#         and each subject
# create data table
#data2 <- data.table(data.set2)

melting <- melt(data.set2, id.vars = c("Subject", "Activity"))
final.data <- dcast(melting, Subject + Activity ~ variable, fun = mean)

#need to print final data set to file
write.table(final.data, file="./data_output.txt", row.names=FALSE)