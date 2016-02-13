#setwd("/Projects/GIT/MOOC/Data Science/assignments/CleaningData_Assgn")

## Activity Labels
activityDF <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)

## Features
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactor = FALSE)

## Read Test Data
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, stringsAsFactors = FALSE)
test_label <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, colClasses = c("factor"))

## Give descriptive variable names
#names(test_data) <- paste("test_", features[,2], sep = "")
names(test_data) <- features[,2]

# Combine Test Data
test_data$subject <- test_subject[,1]
test_data$activity <- test_label[,1]

rm("test_label","test_subject")

## Read Training Data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, stringsAsFactors = FALSE)
train_label <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, colClasses = c("factor"))

## Give descriptive variable names
#names(train_data) <- paste("training_", features[,2], sep = "")
names(train_data) <- features[,2]

# Combine Training Data
train_data$subject <- train_subject[,1]
train_data$activity <- train_label[,1]

rm("train_label","train_subject")

## Merged Test & Training Data
test_data$mode <- "test"
train_data$mode <- "training"
mergedData <- rbind(train_data, test_data)

## Extract only those with "mean" and "standard deviation"
filterData <- mergedData[,append(grep("[mM]ean|[sS]td", names(mergedData)), c(562,563,564))]

## Assign descriptive value for 'activity'
levels(filterData$activity) <- activityDF[,2]

## Reshape data to create Tidy Data
library(reshape2)
longData <- melt(filterData, id = c("subject","activity","mode"))
tidyData <- dcast(longData, subject + activity + mode ~ variable, mean)

## Save the data as text file
write.table(tidyData, "tidyData.txt", row.names = FALSE)

## Clean up
rm("longData")

#### END ####



