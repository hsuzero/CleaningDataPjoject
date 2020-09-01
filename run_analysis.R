#Assigning all data to data frame
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

#Step 1. Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merge.data <- cbind(Subject, X, Y)

#Step 2. Extracts only the measurements on the mean and standard deviation for 
#        each measurement.
library(dplyr)
Tidy.data <- Merge.data %>%
    select(subject, code, contains("mean"), contains("std"))
    
#Step 3. Change Tidy.data code to activity description 
Tidy.data$code <- activities[Tidy.data$code, 2]
Tidy.data$code <- as.factor(Tidy.data$code)

#Step 4. Appropriately labels the data set with descriptive variable names.
names(Tidy.data)[2] <- "activity"
names(Tidy.data)<-gsub("Acc", "Accelerometer", names(Tidy.data))
names(Tidy.data)<-gsub("Gyro", "Gyroscope", names(Tidy.data))
names(Tidy.data)<-gsub("Mag", "Magnitude", names(Tidy.data))
names(Tidy.data)<-gsub("^t", "Time", names(Tidy.data))
names(Tidy.data)<-gsub("^f", "Frequency", names(Tidy.data))
names(Tidy.data)<-gsub("tBody", "TimeBody", names(Tidy.data))
names(Tidy.data)<-gsub("-mean()", "Mean", names(Tidy.data))
names(Tidy.data)<-gsub("-freq()", "Frequency", names(Tidy.data))
names(Tidy.data)<-gsub("angle", "Angle", names(Tidy.data))
names(Tidy.data)<-gsub("gravity", "Gravity", names(Tidy.data))

#Step 5.  From the data set in step 4, creates a second, independent tidy data 
#         set with the average of each variable for each activity and each subject.
FinalDoc <- Tidy.data %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalDoc, "FinalDoc.txt", row.names = FALSE, col.names = TRUE)












