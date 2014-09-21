#Coursera Getting and Cleaning Data by Jeff Leek
#Project
#by Govs September 2014

#Download the data and unzip it if you got the folder "UCI HAR Dataset" then this is not necessary
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="data.zip",method="curl")
unzip("data.zip")

# 1. Merges the training and the test sets to create one data set.

#Read the Sets and Labels of Train and Test 
#Sets
train_set <- read.table("UCI HAR Dataset/train/X_train.txt") 
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
set <- rbind(train_set,test_set)
dim(set)
#Labels
train_label <- read.table("UCI HAR Dataset/train/y_train.txt")
test_label <- read.table("UCI HAR Dataset/test/y_test.txt")
label <- rbind(train_label,test_label)
#Subjects
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(train_subject,test_subject)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("UCI HAR Dataset/features.txt")[,2]
set <- set[,grep("(mean|std)",features)]
names(set) <- features[grep("(mean|std)",features)]
names(set) <- gsub("\\(\\)","",names(set))
names(set) <- gsub("-","",names(set))
dim(set)

# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("UCI HAR Dataset/activity_labels.txt")[2]
label[,1] <- activity[label[,1],]
names(label) <- "Activity"

# 4. Appropriately labels the data set with descriptive variable names. 
names(subject) <- "Subject"
merged <- cbind(subject,label,set)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(data.table)
merged <- data.table(merged)
tidyset <- merged[,lapply(.SD,mean),by=list(Subject,Activity)]
tidyset  <- tidyset [order(tidyset$Subject),]

#Finally we write the file
write.table(tidyset,"tidyDataSet.txt",row.name=FALSE)