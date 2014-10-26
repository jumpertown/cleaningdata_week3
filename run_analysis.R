library(dplyr)

# See CodeBook.md for details for running the script

# Only interested in mean and std features
features <- read.table('UCI HAR Dataset/features.txt')
interestingFeatures <- sort( c(
  grep("-mean\\(\\)", features$V2),
  grep("-std\\(\\)", features$V2)
))

# Combine interesting features of TEST and TRAIN data sets
X <- rbind(
  read.table('./UCI HAR Dataset/test/X_test.txt')[,interestingFeatures],
  read.table('./UCI HAR Dataset/train/X_train.txt')[,interestingFeatures]
)

# Label the dataset
names(X) <- features[interestingFeatures, 2]

# Add the y data
Y <- rbind(
  read.table('./UCI HAR Dataset/test/y_test.txt'),
  read.table('./UCI HAR Dataset/train/y_train.txt')
)
names(Y) = c('activity_id')

# And Subject data
SUBJECT <- rbind(
  read.table('./UCI HAR Dataset/test/subject_test.txt'),
  read.table('./UCI HAR Dataset/train/subject_train.txt')
)
names(SUBJECT) = c('subject')

# Combine all the columns
DATA <- cbind(X,Y,SUBJECT)

# Label the activity
ACTIVITY_LABELS <- read.table('UCI HAR Dataset/activity_labels.txt')
names(ACTIVITY_LABELS) = c('activity_id', 'activity')

# Merges on activity_id
DATA_TIDY <- merge(DATA,ACTIVITY_LABELS)
write.table(DATA_TIDY,row.name=FALSE,file='tidy.txt')

# Average of each variable per activity / subject
SUBJECT_AVGS <- DATA_TIDY %>% group_by(activity, subject) %>% summarise_each(funs(mean))
write.table(SUBJECT_AVGS,row.name=FALSE,file='subject_averages.txt')
