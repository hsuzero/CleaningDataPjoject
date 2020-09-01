## Code Book ##

run_analysis.R perform the data preparation and prepare steps as follow:

### Download data set ###
* download zip file and extracted under folder "UCI HAR Dataset".

### Assign file to Columns ###
* features <- features.txt ( 561 obs, 2 Columns)   
  Shows information about the Columns used on the feature vector.
* activities <- activity_labels.txt ( 6 obs, 2 Columns)
  Links the class labels with their activity name.
* subject_test <- subject_test.txt ( 2947 obs, 1 Column)
  Each row identifies the subject who performed the activity for each window sample.
* x_test <- X_test.txt ( 2947 obs, 561 Columns)     
  Test set.
* y_test <- y_test.txt ( 2947 obs, 1 Column)
  Test labels.
* subject_train <- subject_train.txt ( 7352 obs, 1 Column)
  Each row identifies the subject who performed the activity for each window sample.
* x_train <- X_train.txt ( 7352 obs, 561 Columns)     
  Training set.
* y_train <- y_train.txt ( 7352 obs, 1 Column)     
  Training labels.

### Merges the training and the test sets to create one data set ###
*X(10299 obs, 88 Columns) is created by merging "x_train" and "x_test" using rbind().

*y(10299 obs, 1 Column) is created by merging "y_train" and "y_test" using rbind().

*Subject(10299 obs, 1 Column) is created by merging "subject_train" and "subject_test" using rbind().

*Merge.data(10299 obs, 563 Columns) is created by merging "Subject", "X" and "Y" using cbind().

### Extracts only the measurements on the mean and standard deviation for each measurement ###
*Load dplyr package by using library(dplyr).
*Select these columns: "subject", "code" and any other columns which contain "mean" or "std" from "Merge.data"" to "Tidy.data set".

### Change Tidy.data code to activity description ###
*Entire numbers in "code"" column of Tidy.data replace with corresponding activity taken from 2nd column.
*change the code column type from "numeric" class to "factor" class. 

### Appropriately labels the data set with descriptive variable names###
*Replace the column name "code" by "activities" in Tidy.data.

*Replace "Acc" by "Accelerometer" in all column names.

*Replace "Gyro" by "Gyroscope" in all column names.

*Replace "Mag" by "Magnitude" in all column names.

*Replace all star with t character in column name by "Time".

*Replace all star with f character in column name by "Frequency".

*Replace "tBody" by "TimeBody" in all column names.

*Replace "-mean()" by "Mean" in all column names.

*Replace "-freq()" by "Frequency" in all column names.

*Replace "angle" by "Angle" in all column names.

*Replace "gravity" by "Gravity" in all column names.

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject ###
*FinalDoc (180 obs, 88 Col) is created by summarise function which take means of each variables after grouped by subject and activities.

*Output FinalDoc into FinalDoc.txt file.





