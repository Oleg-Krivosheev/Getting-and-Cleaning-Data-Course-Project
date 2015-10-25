library(data.table)

# STEP 0: download and unpack data

# download
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="UCI HAR Dataset.zip", method="curl")

# and unzip
unzip(zipfile="UCI HAR Dataset.zip", exdir=".")

# STEP 1: Merges the training and the test sets to create one data set.

# first, train data
train.subject  <- fread("UCI HAR Dataset/train/subject_train.txt", data.table=TRUE)
train.set      <- fread("UCI HAR Dataset/train/X_train.txt", data.table=TRUE)
train.activity <- fread("UCI HAR Dataset/train/y_train.txt", data.table=TRUE)

# then, test data
test.subject  <- fread("UCI HAR Dataset/test/subject_test.txt", data.table=TRUE)
test.set      <- fread("UCI HAR Dataset/test/X_test.txt", data.table=TRUE)
test.activity <- fread("UCI HAR Dataset/test/y_test.txt", data.table=TRUE)

# set proper naming
features <-fread("UCI HAR Dataset/features.txt", data.table=TRUE)
setnames(test.set, features$V2)
setnames(train.set, features$V2)

# combining training and test set into single one
total.subject  <- rbind(train.subject, test.subject)
total.set      <- rbind(train.set, test.set)
total.activity <- rbind(train.activity, test.activity)

# add subject and activity columns
test.set[,subject := test.subject$V1][,activity := test.activity$V1]
train.set[,subject := train.subject$V1][,activity := train.activity$V1]
total.set[,subject := total.subject$V1][,activity := total.activity$V1]

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

# create filtered DT
selected.mean_std <- total.set[, grep("mean\\(\\)|std\\(\\)", names(total.set), value=T), with=FALSE]

# add back subject and activity columns
selected.mean_std[,subject := total.subject$V1][,activity := total.activity$V1]

# STEP 3: Uses descriptive activity names to name the activities in the data table.

# read activity labels for each activity id
activity.labels <- fread("UCI HAR Dataset/activity_labels.txt", data.table=TRUE)

# STEP 4: Appropriately labels the data set with descriptive variable names.

# relabel the activity column
selected.mean_std[,activity := as.character(factor(selected.mean_std$activity, labels = activity.labels$V2))]

# STEP 5: From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

# reshape the selected data table
m.dt    <- melt(selected.mean_std, id = c("subject","activity"))

# run mean and collapse mdt, produce tidy data table
tidy.dt <- dcast(m.dt, subject + activity ~ variable, mean)

# Finally, save tidy data set as a CSV to a file in the IETF RFC4180 compatible format
# write.csv(tidy.dt, "tidy.csv", row.names=FALSE, eol = "\r\n")

# Finally, save tidy data set as a TXT file
write.table(tidy.dt, "tidy.txt", row.names=FALSE, eol = "\r\n")
