## The R script

The "run_analysis.R" script performs the following tasks:
- Downloads the data  
- Loads the train and test sets
- Adds some descriptive column names and names the activities in the data sets
- Labels the data set with descriptive variable names
- Merge training and test sets to create one data set
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Creates the file  containing the final tidy data set 
- CreateS a second independent tidy data set with the average of each variable for each activity and each subject.

## Files used in the script:
- train/test 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.


## Variables

Subject
	V1: Values range from 1 to 30.

Activity_labels
	V1: 1,2,3,4,5,6
	V2: WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING

Features
	V1: tBodyAcc-mean()-X
	V2: tBodyAcc-mean()-X
	...
	V561: angle(Z,gravityMean)
	values: positive/negative values from 3-axial signals estimates