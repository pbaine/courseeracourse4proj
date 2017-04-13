#You should create one R script called run_analysis.R that does the following.

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Good luck!

library(stringr)
library(dplyr)

wd <- getwd()
setwd(paste(wd,"/","UCI HAR Dataset", sep = ""))
labels <- read.table("activity_labels.txt", header = F, col.names = c("num", "activity"))
features <- read.table('features.txt', header=F, col.names = c('num', 'feature'))
features <- as.vector(features$feature)

#import train

traindat <- read.table('train/X_train.txt', header = F)
trainlabs <- read.table('train/y_train.txt', header = F, col.names = 'labels')
trainsub <- read.table('train/subject_train.txt', header = F, col.names = 'subject')
train <- cbind(trainsub,trainlabs,traindat)

#import test

testdat <- read.table('test/X_test.txt', header = F)
testlabs <- read.table('test/y_test.txt', header = F, col.names = 'labels')
testsub <- read.table('test/subject_test.txt', header = F, col.names = 'subject')
test <- cbind(testsub, testlabs, testdat)

#combine into one dataframe and assign names
x <- bind_rows(train,test)
names <- c('subject', 'label', features)
colnames(x) <- names

#extract only measurements for mean and std dev
datafilter <- grepl('subject|label|mean|std', names) & !grepl('meanFreq', names)
data <- x[,datafilter]

#name the activities in the data set
for (i in 1:nrow(labels)) {
      data$label[data$label == labels[i, "num"]] <- as.character(labels[i, "activity"])
}

#Appropriately labels the data set with descriptive variable names.
filterednames <- colnames(data)
filterednames <- gsub("tBody", "time-body-", filterednames)
filterednames <- gsub("fBody", "frequency-body-", filterednames)
filterednames <- gsub("tGravity", "time-gravity-", filterednames)
filterednames <- gsub("Acc-","acceleration-",filterednames)
filterednames <- gsub("AccJerk","acceleration-jerk-",filterednames)
filterednames <- gsub("BodyGyroJerkMag-","body-gyro-jerk-magnitude-",filterednames)
filterednames <- gsub("BodyGyroMag-","body-gyro-magnitude-",filterednames)
filterednames <- gsub("AccMag-","acceleration-magnitude-",filterednames)
filterednames <- gsub("GyroJerkMag-","gyro-jerk-magnitude-",filterednames)
filterednames <- gsub("GyroJerk-","gyro-jerk-",filterednames)
filterednames <- gsub("GyroMag-","gyro-magnitude-",filterednames)
filterednames <- gsub("_body_[Bb]ody","-body",filterednames)
filterednames <- gsub("_bodyacceleration_","-body-acceleration-",filterednames)
filterednames <- gsub("_jerk_Mag","-jerk-magnitude-", filterednames)
filterednames <- gsub('Bodyacceleration','acceleration',filterednames)
filterednames <- gsub("Gyro-","gyro-",filterednames)
filterednames <- gsub('-body-body-','-body-',filterednames)
filterednames <- gsub("()-X", "-X", filterednames)
filterednames <- gsub("()-Y", "-Y", filterednames)
filterednames <- gsub("()-Z", "-Z", filterednames)
filterednames <- gsub("\\()","",filterednames)
colnames(data) <- filterednames

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidydataset <- data %>% group_by(subject,label) %>% summarize_each(funs(mean))

write.csv(tidydataset, 'courseera_course4_project.csv')
