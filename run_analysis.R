# Read Datasets
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

# Merges the training and the test sets to create one data set
X <- rbind(X_test, X_train)
Y <- rbind(Y_test, Y_train)

colnames(Y) <- c("Y")
XY <- cbind(X, Y)

# Clear Environment
rm(X,Y, X_test, X_train, Y_test, Y_train)

# Extracting values for mean and std
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
list_of_features <- c(grep("mean()", features$V2, fixed = TRUE),
                      grep("std()", features$V2, fixed = TRUE))
list_of_features <- sort(list_of_features)

XY_cleaned <- XY[c(list_of_features, 562)]
rm(XY)

# Assign activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
XY_cleaned$Y <- activity_labels$V2[XY_cleaned$Y]

#Appropriately labels the data set with descriptive variable names.
colnames(XY_cleaned) <- c(features$V2[list_of_features], "Activity")

library(dplyr)
new_dataset <- tbl_df(XY_cleaned)
new_dataset <- new_dataset %>% group_by(Activity) %>% summarise(across(1:66, mean))
write.table(new_dataset, "tidy.txt", row.name=FALSE) 
