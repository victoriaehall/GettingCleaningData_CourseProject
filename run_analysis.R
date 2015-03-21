##description of script

#Merges the training and the test sets to create one data set.


##read in all necessary tables

#train
setwd("/Users/victoriahall/Desktop/UCI HAR Dataset/train")

train <- read.table("X_train.txt")
trainlabels <- read.table("y_train.txt")
trainsbjt <- read.table("subject_train.txt")

names(trainlabels) <- c("activity")
names(trainlabels)
names(trainsbjt) <- c("subject")
names(trainsbjt)

#combine train tables
train <- cbind(trainsbjt,trainlabels,train)

setwd("/Users/victoriahall/Desktop/UCI HAR Dataset/test")

test <- read.table("X_test.txt")
testlabels <- read.table("y_test.txt")
testsbjt <- read.table("subject_test.txt")

names(testlabels) <- c("activity")
names(testlabels)
names(testsbjt) <- c("subject")
names(testsbjt)

#combine train tables
test <- cbind(testsbjt,testlabels,test)

#load features & activity to understand coding.
setwd("/Users/victoriahall/Desktop/UCI HAR Dataset")

features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

#combine train & test
data <- rbind(train,test)
table(data$subject,data$activity) #make sure that all of the subjects have activities

#Extracts only the measurements on the mean and standard deviation for each measurement. 
meanCols <- grep("mean",features$V2)+2
stdCols <- grep("std",features$V2)+2

Cols <- c(1,2,meanCols,stdCols)
Cols <- sort(Cols)

extract <- data[,c(Cols)]

#Uses descriptive activity names to name the activities in the data set
copyextract <- extract
extract$activity <- factor(extract$activity,levels=c(1,2,3,4,5,6),
                           labels=c("Walking","Walking_Upstairs",
                                    "Walking_Downstairs","Sitting",
                                    "Standing","Laying"))

#Appropriately labels the data set with descriptive variable names. 
ColNum <- Cols-2
ColNum <- ColNum[3:81]

ColNames <- as.character(features[ColNum,"V2"])
ColNames <- c("subject","activity",ColNames)

names(extract) <- ColNames
names(extract)
View(extract)

#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
ColNames <- ColNames[3:81]
ColNames

extractMelt <- melt(extract,id=c("subject","activity"),
                    measure.vars=c("tBodyAcc-mean()-X","tBodyAcc-mean()-Y"))
extractMelt <- melt(extract,id=c("subject","activity"),
                    measure.vars=ColNames)

tidy <- dcast(extractMelt,subject+activity~variable,mean)

write.table(tidy,file="tidy.txt",row.names=FALSE)