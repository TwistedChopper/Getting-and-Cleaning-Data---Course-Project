# About this CodeBook

This CodeBooks purpose is to first describe the dataset being used for this assignment. The second part
of this will then be to describe any transformations on this data completed by run_analysis.R

# About this Dataset

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING,
LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly 
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 
0% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor 
acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low 
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector 
of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants 
can be seen in the following link: [Web Link]


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# ReadME associated with the Dataset

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÓ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

Files included in this dataset

=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window. 
  Its range is from 1 to 30. 
  
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer 
  X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the 
  gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope 
  for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity 
Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International 
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the 
authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

# Transformations Applied to this Dataset within run_analysis.R

The first step that occurs in the R script is not any transformations, but is rather just loading
the data into tables in R.

This next step is to use the "features.txt" file include in the dataset and to use that as the column
names in the "x_test" and "x_train" dataset. Features includes descriptive names for the columns used
in these two data tables and will later be used to filter the data down.

The next transformation after this is to only include column names that are labeled as mean or std. In
the dataset information each column in these datasets is a variable for a certain type of measurement.
In this assignment we are only interested in columns that are a measurement of the mean or std. Therefore
we only include those columns in our final table.

After this we need apply good descriptor names to the Y datasets (y_test and y_train). We do this through
the "activity_lables" dataset which includes a description of what type of activity one of these measurements
was being applied to. 

The next step in this data transformation is now that we have all of the column names we need, we need
to merge all of this data together into one final table. This is done through three stages. The first stages
is to merge all of the x tables together. The next stage is the merge the y tables together. The final stage
is the merge the merged-x table together with the merged-y table. This gives us one large data table to work
off of.

The final portion of this transformation is to take this one single table and to get some summary level
data out of it. For the remaining columns that are left, we want to know their average across a given
subject and activity. So the final stage of this is to group this table by those two fields and provided
the averages of all the other columns.

This then results in the final output of this course. 

# Conclusion

This is a description of the datasets being used and the transformations being applied to them.