# Getting and Cleaning Data Course Project
These days many wearable device companies collect and utilize user data to advance algorithms to attract new users. The aim of this project is to analyze data collected by Anguita, D et al from the accelerometers from the Samsung Galaxy S smartphone of 30 volunteers within the age of 19-48. The original dataset is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, which contains two randomly partitioned sets, the training data (70% of the volunteers) and the test data (30% of the volunteers). 

run_analysis.R is created to do the following:

- Merges the training and the test data sets to create one data set 'Merged'.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
- Appropriately labels the data set with descriptive variable names with the gsub() function.
- Creates a second, independent tidy data set 'FinalCleanData.txt' with the average of each variable for each activity and each subject.

A code book that describes the variables, the data, and any transformations performed can be found in CodeBook.md.
