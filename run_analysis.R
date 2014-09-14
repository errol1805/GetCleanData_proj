
# run_analysis <- function () {

    # downloading data

    fname = 'data.zip'

    if(!file.exists(fname)) {
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipfile <-"data.zip"
        download.file(fileURL, destfile=zipfile)
        unzip(zipfile)
    }


    features <- read.table ("./UCI HAR Dataset/features.txt") #read features table
    activity <- read.table ("./UCI HAR Dataset/activity_labels.txt") #read activity labels
    
    # 1. Merging the training and the test sets to create one data set.    
    #preparing test data
    subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt") #read subject test
    colnames(subjecttest) <- "subject"
    xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
    ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
    xtest <- data.frame(ytest,"test",subjecttest,xtest) # merged the test labels, added another column showing that this is test data, subject info and test data
    colnames(xtest)[1:3] <- c("activity","cat","subject")
    
    #preparing training data
    subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    colnames(subjecttrain) <- "subject"
    xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
    ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
    xtrain <- data.frame(ytrain,"train",subjecttrain,xtrain) # merged the train labels, added another column showing that this is train data, subject info and train data
    colnames(xtrain)[1:3] <- c("activity","cat","subject")

    data <- rbind(xtest,xtrain)  
    
    # 4. Appropriately label the data set with descriptive variable names
    colnames(data)[4:ncol(data)] <- as.character(features[,2]) # renaming columns to descriptive meaning using features.txt
    
    # 3. Use descriptive activity names to name the activities in the data set
    data <- merge(data,activity,by.x = "activity", by.y = "V1",all = TRUE) # joining data$activity column to activity label
    colnames(data)[ncol(data)] <- "actname"
    data <- data[c("activity","actname","cat","subject",colnames(data)[4:ncol(data)-1])] # reordering columns into a sensible order
    
    # 2. Extract only the measurementes on the mean and standard deviation for each measurement    
    data_mean_std <- data.frame(data[c(1:4)],subset(data, select = grepl("mean()",colnames(data))|grepl("std()",colnames(data))))
       
    # 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
    mean_act_sub <- aggregate(data_mean_std,list(data_mean_std$activity,data_mean_std$subject),mean) # calculating mean of each variable for each activity and each subject
    
    # remapping activity column to activity names
    mean_act_sub <- merge(mean_act_sub,activity,by.x="activity", by.y = "V1", all=TRUE) 
    mean_act_sub <- mean_act_sub[c(6,ncol(mean_act_sub),8:ncol(mean_act_sub)-1)]
    colnames(mean_act_sub)[2] <- "activity"
    index <- with(mean_act_sub,order(subject,activity))
    sort.mean_act_sub <- mean_act_sub[index, ]
    
    # writing clean data set to a txt file - note that columns are delimited by spaces " " and new rows use "\n"
    # open with excel to view clean data set.
    write.table(sort.mean_act_sub, file = "clean_data.txt",row.names = FALSE)
# 
# }




