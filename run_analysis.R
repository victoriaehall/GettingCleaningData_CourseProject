##This r script is meant to get and clean data for the course project of the 
#Getting and Cleaning Data course run by Johns Hopkins University and Coursera.

#Data used in this project are from the 
#Human Activity Recognition Using Smartphones Data Set.
#Original information about this data set can be found at this website:
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#Section 1
#Merges the training and the test sets to create one data set.

#Read in train data
setwd("/Users/victoriahall/Desktop/GettingCleaningData_CourseProject/UCI HAR Dataset/train")

train <- read.table("X_train.txt")
trainlabels <- read.table("y_train.txt")
trainsbjt <- read.table("subject_train.txt")

names(trainlabels) <- c("activity")
names(trainsbjt) <- c("subject")

#Combine all train dataframes
train <- cbind(trainsbjt,trainlabels,train)

#Read in test data
setwd("/Users/victoriahall/Desktop/GettingCleaningData_CourseProject/UCI HAR Dataset/test")

test <- read.table("X_test.txt")
testlabels <- read.table("y_test.txt")
testsbjt <- read.table("subject_test.txt")

names(testlabels) <- c("activity")
names(testsbjt) <- c("subject")

#Combine all test dataframes
test <- cbind(testsbjt,testlabels,test)

#Combine train & test dataframes
data <- rbind(train,test)

#Section 2
#Extracts only the measurements on the mean and standard deviation for each measurement. 

#Load features & activity for variable and value names.
setwd("/Users/victoriahall/Desktop/GettingCleaningData_CourseProject/UCI HAR Dataset")

features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

#Use the features dataframe to find all mean & std variables
meanCols <- grep("mean",features$V2)+2
stdCols <- grep("std",features$V2)+2

Cols <- c(1,2,meanCols,stdCols)
Cols <- sort(Cols)

#use column numbers from features table to subset the train/test data
extract <- data[,c(Cols)]

#Section 3
#Uses descriptive activity names to name the activities in the data set
extract$activity <- factor(extract$activity,levels=c(1,2,3,4,5,6),
                           labels=c("Walking","Walking_Upstairs",
                                    "Walking_Downstairs","Sitting",
                                    "Standing","Laying"))

#Section 4
#Appropriately labels the data set with descriptive variable names. 
ColNum <- Cols-2
ColNum <- ColNum[3:81]

ColNames <- as.character(features[ColNum,"V2"])
ColNames <- c("subject","activity",ColNames)

names(extract) <- ColNames
names(extract)
View(extract)

#Section 5
#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

ColNames <- ColNames[3:81]

extractMelt <- melt(extract,id=c("subject","activity"),
                    measure.vars=ColNames)

tidy <- dcast(extractMelt,subject+activity~variable,mean)

#Section 6
#Save the tidy dataset as a txt file
setwd("/Users/victoriahall/Desktop/GettingCleaningData_CourseProject")
write.table(tidy,file="tidy.txt",row.names=FALSE)