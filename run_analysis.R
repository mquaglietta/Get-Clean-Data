library(dplyr)

# Read Datasets
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Merges the training and the test sets to create one data set
X <- rbind(X_test, X_train)
Y <- rbind(Y_test, Y_train)
Subjects <- rbind(Subject_test, Subject_train)

XYSubjects <- cbind(X, Subjects, Y)

rm(X,Y, X_test, X_train, Y_test, Y_train, Subject_test, Subject_train, Subjects) # Clear Environment

# Extracting values for mean and std
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = "character")
features_index <- grep("mean()|std()", features$V2)

XYSubjects_cleaned <- XYSubjects[c(features_index, 562, 563)]

rm(XYSubjects) # Clear Environment

#Appropriately labels the data set with descriptive variable names.
colnames(XYSubjects_cleaned) <- c(features$V2[features_index], "Subject", "Activity")

# Assign activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
XYSubjects_cleaned$Activity <- activity_labels$V2[XYSubjects_cleaned$Activity]

new_dataset <- tbl_df(XYSubjects_cleaned)
new_dataset <- new_dataset %>% group_by(Subject, Activity) %>% summarise(across(1:66, mean))
write.table(new_dataset, "tidy.txt", row.name=FALSE) 
