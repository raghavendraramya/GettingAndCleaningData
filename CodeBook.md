The variables in the run_analysis.R script are as follows:

1. Values_SubjectTrain - Holds data values of the subject in the training set. This is in the file subject_train.txt.
2. Values_SubjectTest - Holds data values of the subject in the test set. This is in the file subject_test.txt.
3. Values_FeaturesTrain - Holds data values of the observations for each activity in the training set. This is in the file x_train.txt.
4. Values_FeaturesTest - Holds data values of the observations for each activity in the test set. This is in the file x_test.txt.
5. Values_ActivityTrain - Holds data values of the activity in the training set. This is in the file y_train.txt.
6. Values_ActivityTest - Holds data values of the activity in the test set. This is in the file y_test.txt.
7. Values_Subject - Holds the merged data set obtained from merging Values_SubjectTrain and Values_SubjectTest.
8. Values_Activity - Holds the merged data set obtained from merging Values_ActivityTrain and Values_ActivityTest.
9. Values_Features - Holds the merged data set obtained from merging Values_FeaturesTrain and Values_FeaturesTest.
10. Feature_Names - Holds contents of features.txt.
11. Activity_Levels - Holds contents of activity_labels.txt.
12. Merged_Data - Holds the merged data set obtained from merging Values_Features, Values_Subject and Values_Activity.
13. Mean_Std_Data - Holds data extracted only the measurements on the mean and standard deviation for each measurement in Merged_Data.
14. Data - Data set corresponding to tidy data.

