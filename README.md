# Getting-and-Cleaning-Data---Course-Project

The repository for my course project for the Coursera Data Science Track course Getting and Cleaning Data.

In this repository there are two different files. In this README, I'll explain what both of those files
are and then to go into how to use this repository. After completing this README you should have a good
understanding of the data that is being used in this project, any types of transformations made to this
data, and a breakdown of how to use the R Script

# CodeBook.md

This is a code book that describes the variables, the data, and any transformations or work that I
performed to clean up the data. In this assignment I'm using the UCI HAR Dataset which is a free dataset
provided by Samsung that includes gyroscope and accelerometer data from their smart phones. The purpose
of this assignment is to load that data into R and them do some transformations on this dataset to get
the data into a tidy format for analysis purposes. This should also include aggregating the dataset up
to show the averages of a variety of different columns for all subjects included in this dataset
and their activities. 

You should use this CodeBook as your reference guide to understand the data that run_analysis.R is using.

# run_analysis.R

This is an R Script that performs the following steps on the UCI HAR dataset described below.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
   variable for each activity and each subject.
   
The detailed processes of how this Script accomplishes those steps is included in the the detailed
commenting within the actual script. Any user should be able to follow along on what each line of code
is accomplishing and using this together with CodeBook.MD should have a perfect knowledge of what
transformations are happening to the data and to understand what this new data means.


# Questions and or comments

Thank you or reviewing my work. If you have any questions or comments on this dataset or how the R Script
works, please send me a private note and I'll get back to you.
