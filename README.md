GettingAndCleaningData
======================

The purpose of this readme file is to explain the steps that are used in the Run_Analysis.R script to prepare the another tiday data set extracted from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Source Of Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Source data contents
  1. 'features_info.txt': Shows information about the variables used on the feature vector.
  2. 'features.txt': List of all features.
  3. 'activity_labels.txt': Links the class labels with their activity name.
  4. 'train/X_train.txt': Training set.
  5. 'train/y_train.txt': Training labels.
  6. 'test/X_test.txt': Test set.
  7. 'test/y_test.txt': Test labels.
  8. 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
  9. 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
  10.'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
  11.'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.
  

Following steps are carried out to analyse and prepare another tidy data set from the above source data

1. We are provided with the Activity data which has 2 data sets: Test and Train Data set under respective folder
2. Train and Test data set are loaded into each data frame inside R script
3. Column Names of Activity data set are provided in features.txt
4. ActivityID of each activity is provided in train/y_train data set
5. SubjectID of each individual is provided in subject data set
6. Once each entity is loaded in each data frame all the entities are sticked together to create a wider table
7. Then train and test data set are switched together to create taller table
8. Since we are asked to calculate the mean and std deviation of each activity we filter out only required column
9. Then each activity is provided with descriptive names 
10. Since we need to need to calculate average of each activity for each subject we change activities in column to row using melt function
11. Then  of mean of each activity is created and exported to text files

Output of the script: tidy_data.txt
