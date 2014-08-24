#
#STEP 1 and 4
#

#Read Labels
features<-read.table("./UCI HAR Dataset/features.txt")
ActivityLabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(ActivityLabels)<-c("Activity_ID","Activity")

#Read TestData
  #step01: read_data
  testData<-read.table("./UCI HAR Dataset/test/X_test.txt")
  #step02: add column names (in fact, descriptive variable names)
  colnames(testData)<-features[,2]
  #step03: read Subject_ID (identifying which of the 30 persons)
  testSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  #step04: read Activity_Label_ID (1-6)
  testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
  #step05: add columns (to the left) identifying Subject & Activity_ID
  testData<-cbind(testSubject,testLabels,testData)
  #step06: add column names on the added columns
  colnames(testData)[c(1,2)]<-c("Subject", "Activity_ID")

#Read TrainData
  #step01: read_data
  trainData<-read.table("./UCI HAR Dataset/train/X_train.txt")
  #step02: add column names (in fact, descriptive variable names)
  colnames(trainData)<-features[,2]
  #step03: read Subject_ID (identifying which of the 30 persons)
  trainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  #step04: read Activity_Label_ID (1-6)
  trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
  #step05: add columns (to the left) of Subject & Activity_ID
  trainData<-cbind(trainSubject,trainLabels,trainData)
  #step06: add column names on the added columns
  colnames(trainData)[c(1,2)]<-c("Subject", "Activity_ID")

#Merge Test AND TrainData
allData<-rbind(testData, trainData)

#
# This finishes STEP 1: Merge the training and the test sets to create one data set
# as well as STEP 4: Appropriately labels the data set with descriptive variable names

#
#STEP 3
#

#Uses descriptive activity names to name the activities in the data set
#Merge ActivityLabels with allData to get (descriptive) Activity Names
allData<-merge(ActivityLabels,allData,all=T)
#merging will cause the merged columns to be to the left
#the following command puts the "Subject" back as the first, then Activity_ID, then Activity
allData<-allData[,c(3,1,2,4:ncol(allData))]

#
#STEP 2
#

#Subset the activity, subject column 
#AND only those columns with "mean" OR "std" in
subsetted_Data<-cbind(allData[,c(1,3)],subset(allData,select=grepl("mean",colnames(allData))|grepl("std",colnames(allData))))


#Correct the Typo's: columnnames with "BodyBody" instead of "Body" 
colnames(subsetted_Data)<-gsub("BodyBody","Body",colnames(subsetted_Data))

#
#STEP 5
#
#Create a second, independent tidy data set with the average of each variable 
#for each activity and each subject
attach(subsetted_Data)
aggData<-aggregate(subsetted_Data[,c(3:ncol(subsetted_Data))],by=list(Subject, Activity), FUN=mean, na.rm=T, simplify=T)
detach(subsetted_Data)

#Rename columns 1 and 2 for readability
colnames(aggData)[c(1,2)]<-c("Subject","Activity")
#Ensure Subject is a Factor
aggData[, 1] <- as.factor(aggData[, 1])
#round all numbers to 3 digits
aggData[c(1:nrow(aggData)),c(3:ncol(aggData))]<-round(aggData[c(1:nrow(aggData)),c(3:ncol(aggData))],digits=3)

# The name of the Tidy Data Set is aggData

#clean up temporary data
rm("testData", "testLabels", "testSubject", "trainData", "trainLabels", "trainSubject", "features", "subsetted_Data","ActivityLabels")
