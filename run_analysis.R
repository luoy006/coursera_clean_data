#install.packages("dplyr") if not already installed
library(dplyr) #load the dplyr package
#the dataset is already downloaded to local computer and stored in the folder 'data' which was set as the working directory

#Firstly assign all data frames and create variable labels for each
features <- read.table("./features.txt", col.names = c("n","functions")) #estimated variables of FFT signals 
activities <- read.table("./activity_labels.txt", col.names = c("code", "activity")) #assigned codes to each of six activities performed  
subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
X_test <- read.table("./test/X_test.txt", col.names = features$functions)
Y_test <- read.table("./test/y_test.txt", col.names = "code")
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
X_train <- read.table("./train/X_train.txt", col.names = features$functions)
Y_train <- read.table("./train/y_train.txt", col.names = "code") 

#Merges the training and the test sets
X <- rbind(X_train, X_test)
Y <- rbind(Y_train, Y_test)
Subjects <- rbind(subject_train, subject_test)
Merged <- cbind(Subjects, Y, X)

#Extract mean and std
TidyData <- Merged %>% select(subject, code, contains("mean"), contains("std"))

#Name activities using descriptive names
TidyData$code <- activities[TidyData$code, 2]

#Label the dataset with descriptive variable names
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

#Create a second datase with the average of each variable for each acitivity and each subject
FinalCleanData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalCleanData, "FinalCleanData.txt", row.name=FALSE)