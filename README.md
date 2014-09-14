# Getting and Cleaning Data Course Project

## Instructions
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

## What is in this folder

This folder contains the script run_analysis.R. To run this script, please clone the repo onto you desktop.

If you're running the script for the first time, the script will download the data from the source stated above and it will perform the analysis stated above.

The output of the function is a txt file "clean_data.txt". This data is this file has columns delimited by spaces " " and "\n" printed at the end of each line

Open with excel to view clean data set using the "space" delimiter to view.

## What run_analysis() does
1. Checks if data exists, if not downloads the data from the source
2. Merges the test and training data into a single data source
3. Cleans the data by putting appropriate column and activity names
4. Subsets the data by only displaying mean and std fo the variables being tested
4. Calculates the mean of each variable by activity and subject
5. Writes the data to the file "clean_data.txt"

## Column Descriptions
*   subject: the id of the subject who performed the activity
*   activity: the type of activity being performed

### Variables tested for each subject and activity
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*   tBodyAcc-XYZ
*   tGravityAcc-XYZ
*   tBodyAccJerk-XYZ
*   tBodyGyro-XYZ
*   tBodyGyroJerk-XYZ
*   tBodyAccMag
*   tGravityAccMag
*   tBodyAccJerkMag
*   tBodyGyroMag
*   tBodyGyroJerkMag
*   fBodyAcc-XYZ
*   fBodyAccJerk-XYZ
*   fBodyGyro-XYZ
*   fBodyAccMag
*   fBodyAccJerkMag
*   BodyGyroMag
*   fBodyGyroJerkMag


The clean data set shows the following for each variable:

*   mean(): Mean value
*   std(): Standard deviation