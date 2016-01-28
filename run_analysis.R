##Merges the training and the test sets to create one data set.
library(dplyr)

setwd('/Users/Laputaalin/R_Homework/Project3/UCI HAR Dataset')

##read data from each file
test_subject <- read.table("test/subject_test.txt", header = FALSE)
test_X <- read.table("test/X_test.txt", header = FALSE)
test_y <- read.table("test/y_test.txt", header = FALSE)
train_subject <- read.table("train/subject_train.txt", header = FALSE)
train_X <- read.table("train/X_train.txt", header = FALSE)
train_y <- read.table("train/y_train.txt", header = FALSE)

activity_labels <- read.table("activity_labels.txt", header = FALSE)

##combine subject, x, and y data from test and train folders
subject <- rbind(train_subject, test_subject)
xdata <- rbind(train_X, test_X)
ydata <- rbind(train_y, test_y)

##1. Merges the training and the test sets to create one data set.
data1 <- merge(activity_labels, 
               cbind(rename(subject, subject=V1), ydata),
               by=("V1"))
data2 <- cbind(data1, xdata)

##read data from features.txt
features <- read.table("features.txt", header = FALSE)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(xdata) <- features[,2]
data3 <- cbind(data1, xdata)
str(data3)
mean_std_data <- select(data3[,-1], contains("subject"), contains("V2"),
                        contains("mean"), contains("std"))
str(mean_std_data)

##3. Uses descriptive activity names to name the activities in the data set
head(mean_std_data$V2, 30)


##4. Appropriately labels the data set with descriptive variable names
names(mean_std_data)<-gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data)<-gsub("^t", "Time", names(mean_std_data))
names(mean_std_data)<-gsub("(t", "Time", names(mean_std_data))
names(mean_std_data)<-gsub("Acc", "Acceleration", names(mean_std_data))
names(mean_std_data)<-gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data)<-gsub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data)<-gsub("V2", "activity", names(mean_std_data))
names(mean_std_data)<-gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data)

##5. From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject.
library(plyr)
Data5 <- aggregate(. ~subject + activity, mean_std_data, mean)
Data5 <- Data5[order(Data5$subject, Data5$activity),]
write.table(Data5, file="tidydata.txt", row.names = FALSE)


## To clean up the data CodeBook.md
library(knitr)
knit2html("CodeBook.md")

