
# Variable and Data Description
In the dataset obtained after the cleaning process you will find 67 column and only 6 rows.
Each row represents an activity.
The last column is the activity performed while the other are the averaged mean and std measurement for that activity of the following variables:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


# Cleaning Up Process
The first step was to merge vertically the X_train and X_test dataset and the Y_train and Y_test dataset.
Then merge orizzontaly the the two resultant datasets.

The second step was to grep from the features file the indexes of mean and std measurement.
Then use this information to create a new dataset with only this information

The third step was to assign to the Activity column (Y) the activity labeles for each row.
From the list obtained from the second step I also renamed the variable name of the the dataset.

In the last step I used dplyr to group by activity and calculate the averaged value for each variable.
