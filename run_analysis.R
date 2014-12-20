#reads X_test.txt data
test_dataX <- read.table("./test/X_test.txt", sep = "")
test_dataY <- read.table("./test/Y_test.txt", sep = "")
test_subject <- read.table("./test/subject_test.txt", sep = "")

#extracts data from features containing mean and std
features <- read.table("./features.txt")
subset_features <- features[grep("mean()|std()", features$V2),]
features <- NULL

#from features, extracts the values that will be used to label columns
column_names <- c("subject", "activity", as.character(subset_features$V2))
#from features, extract the values that will be used to label columns
column_numbers <- as.integer(subset_features$V1)

#extracts columns from testdata
subset_test <- test_dataX[, column_numbers]
subset_test_XY<- cbind(test_subject, test_dataY, subset_test)
#delete dataset to and free memory
test_dataX <- NULL
test_dataY <- NULL
subset_test <- NULL
test_subject <- NULL
gc()

#labels the columns
colnames(subset_test_XY) <- column_names

#reads X_train.txt data
train_dataX <- read.table("./train/X_train.txt", sep = "")
train_dataY <- read.table("./train/Y_train.txt", sep = "")
train_subject <- read.table("./train/subject_train.txt", sep = "")

#extracts columns from traindata
subset_train <- train_dataX[, column_numbers]
subset_train_XY<- cbind(train_subject, train_dataY, subset_train)
#delete dataset to and free memory
train_dataX <- NULL
train_dataY <- NULL
subset_train <- NULL
train_subject <- NULL
gc()

#labels the columns
colnames(subset_train_XY) <- column_names

#combines datasets and discard both subsets to release memory
combined_data <- rbind(subset_test_XY, subset_train_XY)
subset_test_XY <- NULL
subset_train_XY <- NULL
gc()

#replaces integers in activity with factors
combined_data$activity[combined_data$activity == 1] <- "WALKING"
combined_data$activity[combined_data$activity == 2] <- "WALKING_UPSTAIRS"
combined_data$activity[combined_data$activity == 3] <- "WALKING_DOWNSTAIRS"
combined_data$activity[combined_data$activity == 4] <- "SITTING"
combined_data$activity[combined_data$activity == 5] <- "STANDING"
combined_data$activity[combined_data$activity == 6] <- "LAYING"

#calculates the average of each activity and subject
summarized_data <- aggregate(combined_data[,3:81], list(subject = combined_data$subject, activity = combined_data$activity), mean)
  

