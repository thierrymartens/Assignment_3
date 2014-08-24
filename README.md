---
title: "README"
author: "Thierry Martens"
date: "Sunday, August 24, 2014"
output: html_document
---

==================================================================
Creating a tidy data set, starting from following dataset:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

ORIGINAL DATASET
================
The original dataset was created by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
This link will guide you to a zip-file containing the base data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Unzipping this file in the working directory will create a subdirectory "UCI HAR Dataset" containing the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

I will not detail the contents of each of these files, but refer the interested reader to the README.txt and the 
features_info.txt for a detailed explanation of the files, their content, and how the dataset was prepared!


GETTING TO A TIDY DATASET
=========================

I did not follow "literally" the sequence as suggested in the task description.
As such, in the explanation that follows "STEP 1 and 4" will be the first steps,
then "STEP 3", then "STEP 2", to finish with "STEP 5".
While this may seem a bit confusing, I hope the explanations here will dispell that confusion!

SO, the following steps were performed to get to a tidy dataset:

STEP 1 & 4
==========
In this part, the training and the test sets were merged together to create one data set.
The columns containing the results were named, using the descriptive variable names, 
AS PROVIDED BY the original researchers.
I have opted for this choice, because, like it or not, these are the names the researches chose, AND DOCUMENTED,
extensively, in their paper/files describing the data set.
Making changes will, in my viewpoint, only make it more difficult for the user to interpret the results,
as the "new" names need (somehow) be mapped to the "original" names.
In fact, I follow here the point made by Argyn Kuketayev on the discussion forum
(see: https://class.coursera.org/getdata-006/forum/thread?thread_id=132)

However, 2 columns are added (to the left): Subject (identifying the volunteer in the original data gathering exercise),
as well as an Activity_ID (identifying which of the 6 activities were performed during the data gathering).
 

STEP 3
======
Here, the activity_ID (a number from 1 to 6) is "translated" to an activity description ("LAYING", "SITTING", ...)
After linking the Activity_ID with Activity (description), I rearrange the columns on the left a bit so that the
resulting data frame still has "Subject" as the first column.


STEP 2
======
Next, only the variables showing either the mean and standard deviation for each measurement are extracted (subsetted).
I have, deliberately, chosen to take the mean & standard deviation of 20 variables in the "time domain"
  tBodyAcc-XYZ => since there are 3 axis, these are 3 variables (same for the next 4)
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag => this is just 1 variable
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag

and 13 in the Frequency domain
	fBodyAcc-XYZ => since there are 3 axis, there are 3 variables (same for the next 2)
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag => just one variable
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag
For these last ones, besides a mean and a stdev, there is also a "mean Frequency", which I have also opted to retain
=> thus leading to 2 x 20 + 3 x 13 = 79 measures.


STEP 5
======
We now take the average for each variable (i.e. 79 averages), which together with the identifiers for Subject, and Activity,
lead to 81 columns in the resulting data frame,
and since there are 6 different exercises performed by each of the 30 volunteers, there are 180 observations
in our final (tidy) data set!

This data.frame is named aggData


 
