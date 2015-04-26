## The following RScript called run_analysis.R will do the following steps on the UCI HAR Dataset
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.


##Throughout the course of this script I'll be commenting what step each portion of code is working with out
##of the 5 requirements listed above.

##NOTE: I did not do all of these 5 steps in an exact order. I felt it made most sense for the way that I
##approached this problem to do some steps before others. However, all the steps are completed by the end
##of my code.

##More information on this dataset and descriptions of the data, variables, and transformations can be found
##in the CodeBook.md file within this repository. General information can be found in ReadMe.md.



##----------------------Begin Script----------------------##

TidyData <- function() {
        ##Loading Required Libraries
        library(data.table)
        library(dplyr)
        library(reshape2)
        
        ##Setting the Working Directory to base location
        setwd('/Users/Kyle/School/Cousera - Data Science Certification/03- Getting and Cleaning Data/R/UCI HAR Dataset')
        
        
        ##Read the data from the seperate UCI HAR tablles into tables. 
        
        ##Train Tables
        subject_train  <- read.table("train/subject_train.txt",header=FALSE)
        x_train        <- read.table("train/X_train.txt",header=FALSE)
        y_train        <- read.table("train/y_train.txt",header=FALSE)
        
        ##Test Tables
        subject_test   <- read.table("test/subject_test.txt",header=FALSE)
        x_test         <- read.table("test/X_test.txt",header=FALSE)
        y_test         <- read.table("test/y_test.txt",header=FALSE)
        
        ##Activity lables table
        activity_labels <- read.table("activity_labels.txt")[,2] ##Creating a factor variable with 6 levels
        
        ##Features table
        features <- read.table("features.txt")[,2] ##Creating a factor variable with 477 levels
        
        
        
        ##All files are now loaded into R.
        
        
        
        ##Step 2 (partial): Including only the variables of features that includes either the mean or the std by
        ##                  creating a vector of TRUE and FALSE when a name has mean or std.
        meanstd_features <- grepl("mean|std", features)
        
        
        ##Step 4 (complete): Apply column names (from features) into the x_test and x_train dataset
        names(x_test)  = features
        ##str(x_test)
        names(x_train) = features
        ##str(x_train)
        
        
        ##Step 2 (complete): Filtering down the columns in the x_test and x_train dataset to only include 
        ##                   columns that include mean or std
        x_test  = x_test[,meanstd_features]
        ##str(x_test)
        x_train = x_train[,meanstd_features]
        ##str(x_train)
        
        
        ##Step 3 (complete): Applying Activity Names to y datasets
        y_test[,2] = activity_labels[y_test[,1]]
        names(y_test) = c("ActivityID", "ActivityName")
        ##str(y_test)
        names(subject_test) = "Subject"
        ##str(subject_test)
        
        y_train[,2] = activity_labels[y_train[,1]]
        names(y_train) = c("ActivityID", "ActivityName")
        ##str(y_train)
        names(subject_train) = "Subject"
        ##str(subject_train)
        
        ##Step 1 (complete): Merging all off the datasets together to form one dataset
        
        ##Merging all of the test datasets together
        test_data <- cbind(as.data.table(subject_test), y_test, x_test)
        ##str(test_data)
        
        ##Merging all of the train datasets together
        train_data <- cbind(as.data.table(subject_train), y_train, x_train)
        ##str(train_data)
        
        ##Merging the full test dataset and the full train dataset together to have one large dataset
        full_data = rbind(test_data, train_data)
        ##str(full_data)
        
        
        ##Step 5 (complete): Turning the one large dataset into a tidy dataset that includes the average of each 
        ##                   variable for each activity and each subject.
        
        ##Creating a vector of column names
        columnnames   = c("Subject", "ActivityID", "ActivityName")
        
        ##Creating another vector of a union of id_labels and the column names in the data table.
        ##The setdiff function allows us to perform a set union of two vectors.
        data_columnnames  = setdiff(colnames(full_data), columnnames)
        
        ##Changing the grain of our 'data' table by using the melt function
        melting_data    = melt(full_data, id = columnnames, measure.vars = data_columnnames)
        
        ##Apply mean function to the melted dataset using dcast function
        final_output   = dcast(melting_data, Subject + ActivityName ~ variable, mean)
        ##str(final_output)
        
        ##Wrapping everything up by creating a text file in my working directory of this tidy data.
        write.table(final_output, file = "final_output.txt", row.names = FALSE)
}

##End Script





