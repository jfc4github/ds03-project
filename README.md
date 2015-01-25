Readme.md

Project Repository
==================

Project Goals
-------------

It works with some data sets (see requirements below):

1. To merge the training and the test sets to create one data set.
2. To extract only the measurements on the mean and standard deviation for each measurement.
3. To use descriptive activity names to name the activities in the data set
4. To label appropriately the data set with descriptive activity names.
5. To create a second, independent tidy data set with the average of each variable for each activity and each subject.

Requirements
------------

The data sets are to be downloaded from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The R packages *reshape2* and *data.table* should be available to the R installation.

Procedure
---------

1. Download the data sets and put them on a folder called "UCI HAR Dataset".
2. Set that folder as the R working folder (using the function `setwd`).
3. Put in that folder the script "run_analysis.R".
4. Load the script (using the function `source`).
5. It will generate a text file called "result.txt".


List of files
-------------

### run_analysis.R

This file includes a script called **run_analysis** that 
merges the training and the test sets to create one single data set, extract the required values, 
creates a second, independent tidy data set and stores it in a file called "result.txt". 

