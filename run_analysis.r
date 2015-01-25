## run_analysis.R
## created: 25.01.2015

## Dependencies

require("reshape2")
require("data.table")


## Read the test & training data set (data only, no headers included)

# for test:
dt_test_x <- read.table("./test/X_test.txt", header=FALSE)
dt_test_y <- read.table("./test/y_test.txt", header=FALSE)

# for training:
dt_train_x <- read.table("./train/X_train.txt", header=FALSE)
dt_train_y <- read.table("./train/y_train.txt", header=FALSE)


## Set the header for 'x' data, by reading it from features

features <- read.table("./features.txt")[,2]

# for test:
names(dt_test_x) <- features

# for training:
names(dt_train_x) <- featuresq()

## Set the header for 'y' data, by reading it from activity_labels

activity_labels <- read.table("activity_labels.txt")[,2]

# for test:
dt_test_y[,2] <- activity_labels[dt_test_y[,1]]
names(dt_test_y) <- c("Activity-ID", "Activity-Label")

#for training:
dt_train_y[,2] <- activity_labels[dt_train_y[,1]]
names(dt_train_y) <- c("Activity-ID", "Activity-Label")

## Extract only the measurements on the mean and standard deviation for each measurement.

features_mean_std <- (features == "mean" | features == "std")

# for test:
dt_test_x = dt_test_x[,features_mean_std]

# for training:
dt_train_x = dt_train_x[,features_mean_std]

## Read the subject information

# for test:
dt_test_subject <- read.table("./test/subject_test.txt", header=FALSE)
names (dt_test_subject) <- c("subject")

# for training:
dt_train_subject <- read.table("./train/subject_train.txt", header=FALSE)
names (dt_train_subject) <- c("subject")

print(4)
## Create the full test & training data set

# for test:
dt_test <- cbind(as.data.table(dt_test_subject), dt_test_y, dt_test_x)

print(45)

# for training:
dt_train <- cbind(as.data.table(dt_train_subject), dt_train_y, dt_train_x)

print(5)
# Task 1: Merge test and train data
data <- rbind(test_data, train_data)

# Task 5: New independent tidy data set

labels_id   <- c("subject", "Activity-ID", "Activity-Label")

labels_data <- setdiff(colnames(data), labels_id)

melt_data <- melt(data, id = labels_id, measure.vars = labels_data)

# Get the average using the dcast + mean function
result   <- dcast(melt_data, subject + Activity-Label ~ variable, mean)

# Store the new tidy data set in a 
write.table(result, file = "./result.txt")
