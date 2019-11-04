# Code Book

All data required are downloaded and stored in the working directory. Download and load the dplyr package before start.

0. Assign each data to variables
- features.txt contain fast fourier transformed data from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- activity_labels.txt specify list of activities performed and its codes (labels).
- subject_test.txt and subject_train.txt each contains test data of 9/30 and 21/30 volunteer test subjects being observed
- For the test data, X_test.txt contains recorded features test data, and y_test.txt contains test data of activities’code labels.
- For the training data, X_train.txt contains recorded features train data and y_train.txt contains train data of activities’code labels.
- The same class of data (i.e. subject, X and Y) from the test and train data set will be merged in the following section (vide post).

1. Merges the training and the test sets to create one data set
X (10299 rows, 561 columns), Y (10299 rows, 1 column) and Subjects (10299 rows, 1 column) are created by the rbind() function on respective data sets.
These three data sets are then further merged into Merged (10299 rows, 563 column) using cbind() function

2. Extracts only the measurements on the mean and standard deviation
TidyData (10299 rows, 88 columns) is created by subsetting the Merged data, selecting only the following columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement using select().

3. Uses descriptive activity names to name the activities in the data set
Entire numbers in the 'code' column of the TidyData are replaced with corresponding activity taken from the second column of the activities variable (i.e. the activity_label.txt table).

4. Appropriately labels the data set with descriptive variable names
Names of individual variables are substituted and restored using gsub().

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalCleanData.txt is created and exported by summarising TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
