#Course project for "Getting and cleaning data".

library(plyr)
library(data.table)

#set working directory to the location where the UCI HAR Dataset was unzipped
setwd('C:/Users/rraghave/Documents/Coursera-DataScience/Getting-Cleaning-Data/CourseProject/UCI HAR Dataset');

#Merges the training and the test sets to create one data set.

Values_SubjectTrain     = read.table('train/subject_train.txt'); #read subject_train.txt
Values_FeaturesTrain    = read.table('train/x_train.txt'); #read x_train.txt
Values_ActivityTrain    = read.table('train/y_train.txt'); #read y_train.txt

Values_SubjectTest      = read.table('test/subject_test.txt'); #read subject_train.txt
Values_FeaturesTest     = read.table('test/x_test.txt'); #read x_train.txt
Values_ActivityTest     = read.table('test/y_test.txt'); #read y_train.txt

Values_Subject  <- rbind(Values_SubjectTrain, Values_SubjectTest)
Values_Activity <- rbind(Values_ActivityTrain, Values_ActivityTest)
Values_Features <- rbind(Values_FeaturesTrain, Values_FeaturesTest)

names(Values_Subject) <- c("subject")
names(Values_Activity) <- c("activity")
Feature_Names  <- read.table("features.txt"); #reads features.txt
Activity_Levels <- read.table("activity_labels.txt") #reads activity_labels.txt
names(Values_Features) <- Feature_Names$V2
Merged_Data <- cbind(Values_Features, Values_Subject, Values_Activity)

#Extracts only the measurements on the mean and standard deviation for each measurement.
Mean_Std_Data <- Merged_Data[grep("mean()|std()", names(Merged_Data))]

#Uses descriptive activity names to name the activities in the data set

Merged_Data$activity <- as.character(Merged_Data$activity)
Merged_Data$activity[Merged_Data$activity == 1] <- "Walking"
Merged_Data$activity[Merged_Data$activity == 2] <- "Walking Upstairs"
Merged_Data$activity[Merged_Data$activity == 3] <- "Walking Downstairs"
Merged_Data$activity[Merged_Data$activity == 4] <- "Sitting"
Merged_Data$activity[Merged_Data$activity == 5] <- "Standing"
Merged_Data$activity[Merged_Data$activity == 6] <- "Laying"
Merged_Data$activity <- as.factor(Merged_Data$activity)

#Appropriately labels the data set with descriptive variable names.

names(Merged_Data) <- gsub("Acc", "Accelerator", names(Merged_Data))
names(Merged_Data) <- gsub("Mag", "Magnitude", names(Merged_Data))
names(Merged_Data) <- gsub("Gyro", "Gyroscope", names(Merged_Data))
names(Merged_Data) <- gsub("^t", "time", names(Merged_Data))
names(Merged_Data) <- gsub("^f", "frequency", names(Merged_Data))

#create a second, independent tidy data set with the average of each variable for each activity and each subject.
Merged_Data.dt <- data.table(Merged_Data)
Data <- Merged_Data.dt[, lapply(.SD, mean), by = 'subject,activity']
write.table(Data, file = "tidy_data.txt",row.names = FALSE)

