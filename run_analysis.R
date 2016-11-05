
# "Getting and Cleaning Data" - Course Project
#  run_analysis.R


# Download the data  
if (!file.exists("dataset.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, "dataset.zip", method="auto")
}  
unzip("dataset.zip") 


# Load the train and test sets
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/x_train.txt")
y_train<- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test<- read.table("UCI HAR Dataset/test/x_test.txt")
y_test<- read.table("UCI HAR Dataset/test/Y_test.txt")


# Adds some descriptive column names and names the activities in the data sets
activity_labels<- read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("ID_activity", "Activity")
colnames(subject_train) <- "ID_subject"
colnames(y_train) <-"ID_activity"
colnames(subject_test) <- "ID_subject"
colnames(y_test) <-"ID_activity"
y_train <- merge(y_train, activity_labels , by = 'ID_activity')
y_test <- merge(y_test, activity_labels , by = 'ID_activity')


# Appropriately labels the data set with descriptive variable names
features <- read.table('UCI HAR Dataset/features.txt')
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2] 


# Merge training and test sets to create one data set
train <- cbind(subject_train, "Activity"=y_train$Activity, x_train)
test <- cbind(subject_test, "Activity"=y_test$Activity, x_test)
all_Data <- rbind(train,test)
View(all_Data)


# Extracts only the measurements on the mean and standard deviation for each measurement.
all_Data_colNames <- colnames(all_Data)
selectedFeatures <- grepl("ID_subject|Activity|mean..|std..", all_Data_colNames )
finalDataSet <- all_Data[,selectedFeatures==TRUE]
View(finalDataSet)  

#Creates the file  containing the final tidy data set 
write.table(finalDataSet, "UCI HAR Dataset/FinalTidySet.txt", row.name=FALSE)

                                                                                               
# Create a second independent tidy data set with the average of each variable for each activity and each subject.
aggdataset <-aggregate(finalDataSet, by=list("ID_subject","Activity") , mean)
write.table(aggdataset, "UCI HAR Dataset/aggdataset.txt", row.name=FALSE)



