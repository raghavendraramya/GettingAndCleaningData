# GettingAndCleaningData Course Project
The R script run_analysis.R does the following

1. The script reads in all the test and train data from the downloaded files.
2. Merges the training and the test sets to create one data set. This is done using cbind and rbind.
3. Extracts only the measurements on the mean and standard deviation for each measurement. This is done using grep.
4. Uses descriptive activity names to name the activities in the data set. This is done by replacing the integer coreesponding to the activity by the appropriate activity label like 'walking', 'sitting', etc.
5. Appropriately labels the data set with descriptive variable names. This is done using gsub.
6. From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is done using package data.table, lapply and write.table.
