# CodeBook
This codebook describes:
1. variables
2. data
3. Transformations or work that I performed to clean up the data

# Background information
All the background information can be found at the [UCI Machine Learning Repositroy](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
There are also 3 useful file under the 'UCI HAR Dataset' directory:
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.

## Variables
Dataset has 68 variables (columns) the last 66 are given from the mean and std measurement of theese features
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
First two are:
* Subject ID
* Activity Label

## Data
Each row represents the average observation for that subject performing that activity.

## Process to clean up the data
The first thing I did was to merge vertically X_train and X_test, Y_train_ and Y_test, Subject_train and Subject_test.

Then merge orizontally the resultant datasets.

Created this complete dataset I:
1. Read the features list
2. Grep mean and std variables from the features list
3. Filtered the original list for mean and std
4. Renamed columns with the feature list and last labels (Subject and Activity)
5. Renamed all the activity with the rispettive label
6. Used dplyr to group by activity and subject and average all values
