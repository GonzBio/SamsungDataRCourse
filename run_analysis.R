#reads X_test.txt data
dataXtest <- read.table("./test/X_test.txt", sep = "")
dataYtest <- read.table("./test/Y_test.txt", sep = "")
testsubject <- read.table("./test/subject_test.txt", sep = "")

#extracts data from features containing mean and std
features <- read.table("./features.txt")
subsetfeatures <- features[grep("mean()|std()", features$V2),]
features <- NULL

#from features, extracts the values that will be used to label columns
columnnames <- c("subject", "activity", as.character(subsetfeatures$V2))
#from features, extract the values that will be used to label columns
columnnumbers <- as.integer(subsetfeatures$V1)

#extracts columns from testdata
subsetXtest <- dataXtest[, columnnumbers]
subsetXYtest<- cbind(testsubject, dataYtest, subsetXtest)
#delete dataset to and free memory
dataXtest <- NULL
dataYtest <- NULL
subsetXtest <- NULL
testsubject <- NULL
gc()

#labels the columns
colnames(subsetXYtest) <- columnnames

#reads X_train.txt data
dataXtrain <- read.table("./train/X_train.txt", sep = "")
dataYtrain <- read.table("./train/Y_train.txt", sep = "")
trainsubject <- read.table("./train/subject_train.txt", sep = "")

#extracts columns from traindata
subsetXtrain <- dataXtrain[, columnnumbers]
subsetXYtrain<- cbind(trainsubject, dataYtrain, subsetXtrain)
#deletes used datasets and frees memory
dataXtrain <- NULL
dataYtrain <- NULL
subsetXtrain <- NULL
trainsubject <- NULL
gc()

#labels the columns
colnames(subsetXYtrain) <- columnnames

#combines datasets and discards both datasets to release memory
combined <- rbind(subsetXYtest, subsetXYtrain)
subsetXYtest <- NULL
subsetXYtrain <- NULL
gc()

#replacing integers in activity with factors
combined$activity[combined$activity == 1] <- "WALKING"
combined$activity[combined$activity == 2] <- "WALKING_UPSTAIRS"
combined$activity[combined$activity == 3] <- "WALKING_DOWNSTAIRS"
combined$activity[combined$activity == 4] <- "SITTING"
combined$activity[combined$activity == 5] <- "STANDING"
combined$activity[combined$activity == 6] <- "LAYING"

#calculates the average of each activity and subject
summarydata <- aggregate(combined[,3:81], list(subject = combined$subject, activity = combined$activity), mean)
