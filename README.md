# courseera Getting and Cleaning Data Project

This is the contents of the project for course 4 for courseera. The files included in this repo include:

README

Codebook.md - Which explains the variables and modifications made

courseera_course4proj.csv - Final output of run_analysis.R which is a tidy dataset of the means of each measurement for each test subject

run_analysis.R - The code which imports, cleans, filters, and modifies the UCI HAR data

UCI HAR Dataset - The original data


The run_analysis.R script first sets the working directory to the UCI HAR Dataset folder and imports the necessary files:

wd <- getwd()
setwd(paste(wd,"/","UCI HAR Dataset", sep = ""))
labels <- read.table("activity_labels.txt", header = F, col.names = c("num", "activity"))
features <- read.table('features.txt', header=F, col.names = c('num', 'feature'))
features <- as.vector(features$feature)

It then imports the training and test datasets and merges them into one file:

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

It then filters the data for only mean and standard deviation measurements and replaces the activity labels with the descriptive names:

#extract only measurements for mean and std dev
datafilter <- grepl('subject|label|mean|std', names) & !grepl('meanFreq', names)
data <- x[,datafilter]

#name the activities in the data set
for (i in 1:nrow(labels)) {
      data$label[data$label == labels[i, "num"]] <- as.character(labels[i, "activity"])
}

It then modifies the variable names to be more descriptive, calculates the mean for each variable for each subject, and then exports the tidy data set into a new csv file.


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
