#setwd("F:\\Cousera\\DataScience\\Getting and Cleaning Data\\Quiz And Assignment\\Quiz1\\data\\UCI HAR Dataset")

#1. Merges the training and the test sets to create one data set.
##Read Y Data from train and test
y_data_test <- read.table("test/y_test.txt", header=F, col.names=c("ActivityID"))
y_data_train <- read.table("train/y_train.txt", header=F, col.names=c("ActivityID"))

##Read features.txt . 2nd column is to be used as columnName of X data
x_data_cols <- read.table("features.txt", header=F,col.names=c("ColID", "ColName"))

##Read x Data from train and test and use ColNames in x_data_cols
x_data_test <- read.table("test/x_test.txt", header=F, col.names = x_data_cols$ColName)
x_data_train <- read.table("train/x_train.txt", header=F, col.names = x_data_cols$ColName)

##Read Subject data
subject_test <- read.table("test/subject_test.txt", header=F, col.names=c("SubjectID"))
subject_train <- read.table("train/subject_train.txt", header=F, col.names=c("SubjectID"))

## add the activityid and subjectid columns
x_data_test$ActivityID <- y_data_test$ActivityID
x_data_test$SubjectID <- subject_test$SubjectID

x_data_train$ActivityID <- y_data_train$ActivityID
x_data_train$SubjectID <- subject_train$SubjectID

##Merge x data
merged_x_data <- rbind(x_data_test,x_data_train)


#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
ColumnNameOfDataFrame_X <-names(merged_x_data)
#get only the column name with std. and mean. \\is escape seq for . include SubjectID and ActivityID
RequiredColsIndex<-grep("std\\.|mean\\.|SubjectID|ActivityID",ColumnNameOfDataFrame_X,value=F)

#subset only the required data
merged_x_data_required<-merged_x_data[,RequiredColsIndex]

#3 Uses descriptive activity names to name the activities in the data set

#Read Activity Names from activit ylable files
Activity_Name <- read.table("activity_labels.txt", header=F, col.names=c("ActivityID", "ActivityName"))

#Left join equivalent of to Activity Details
FinalMergedData<-merge(x=merged_x_data_required,y=Activity_Name,by="ActivityID",all.x=TRUE)

#4Appropriately labels the data set with descriptive variable names.
cnames <- colnames(FinalMergedData) 
DescriptiveColName <- gsub("\\.*mean\\.*", cnames, replacement="Mean")
DescriptiveColName <- gsub("\\.*std\\.*",  DescriptiveColName, replacement="StandardDeviation")
colnames(FinalMergedData) <- DescriptiveColName

#5Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 library(reshape2)

 # melt the dataset
id_vars = c("ActivityID", "ActivityName", "SubjectID")
measure_vars = setdiff(colnames(FinalMergedData), id_vars)
FinalMergedData_Melted <- melt(FinalMergedData, id=id_vars, measure.vars=measure_vars)

# recast 
tidyData<-dcast(FinalMergedData_Melted, ActivityID + ActivityName + SubjectID ~ variable, mean)    
  
 # Write the final data to file
write.table(tidyData,file ="tidy_data.txt",row.names = FALSE)

#cleanAllVariables
rm(list = setdiff(ls(), lsf.str()))










