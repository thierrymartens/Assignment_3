---
title: "Code Book"
author: "Thierry Martens"
date: "Sunday, August 24, 2014"
output: html_document
---

There are 81 variables:
Subject: 
 - Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
 - Identifier for the (30) volunteers during the data gathering exercise
 
Activity: 
 - Factor w/ 6 levels "LAYING","SITTING",..
 - Identifier to describe the 6 exercises performed by the volunteers
 
The other 79 variables are the mean and standard deviation (and for the FFT variables the meanFrequency as well);
all variables lie within [-1,1], and are rounded to 3 digits:
(whenever a -XYZ follows the name, it means there are 3 variables for each of the axes!)

tBodyAcc-mean()-XYZ
tBodyAcc-std()-XYZ

tGravityAcc-mean()-XYZ
tGravityAcc-std()-XYZ

tBodyAccJerk-mean()-XYZ
tBodyAccJerk-std()-XYZ

tBodyGyro-mean()-XYZ
tBodyGyro-std()-XYZ

tBodyGyroJerk-mean()-XYZ
tBodyGyroJerk-std()-XYZ

tBodyAccMag-mean()
tBodyAccMag-std()

tGravityAccMag-mean()
tGravityAccMag-std() 

tBodyAccJerkMag-mean() 
tBodyAccJerkMag-std()

tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()

fBodyAcc-mean()-XYZ
fBodyAcc-std()-XYZ
fBodyAcc-meanFreq()-XYZ

fBodyAccJerk-mean()-XYZ
fBodyAccJerk-std()-XYZ
fBodyAccJerk-meanFreq()-XYZ

fBodyGyro-mean()-XYZ
fBodyGyro-std()-XYZ
fBodyGyro-meanFreq()-XYZ

fBodyAccMag-mean()
fBodyAccMag-std()
fBodyAccMag-meanFreq()

fBodyAccJerkMag-mean()
fBodyAccJerkMag-std()
fBodyAccJerkMag-meanFreq()

fBodyGyroMag-mean()
fBodyGyroMag-std()
fBodyGyroMag-meanFreq()

fBodyGyroJerkMag-mean()
fBodyGyroJerkMag-std()
fBodyGyroJerkMag-meanFreq()

