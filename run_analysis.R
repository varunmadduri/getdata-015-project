library(plyr) 


## ---------------------
## 1) Merges the training and the test sets to create one data set
##    Put the results in a folder called "./combined"
##    Create a list of filenames, and then combine all of them in a loop
## ---------------------
dir.create("./combined", recursive = T, showWarnings = F)
dir.create("./combined/Inertial Signals", recursive = T, showWarnings = F)

filenames <- c(
        "subject", "X", "Y",
        "Inertial Signals/body_acc_x", "Inertial Signals/body_acc_y", "Inertial Signals/body_acc_z",
        "Inertial Signals/body_gyro_x", "Inertial Signals/body_gyro_y", "Inertial Signals/body_gyro_z",
        "Inertial Signals/total_acc_x", "Inertial Signals/total_acc_y", "Inertial Signals/total_acc_z"
    )

for (f in filenames) {
    file1 <- paste("./train/", f, "_train.txt", sep = "")
    file2 <- paste("./test/", f, "_test.txt", sep = "")
    fileCombined <- paste("./combined/", f, ".txt", sep = "")
        
    d1 <- read.csv(file1, header = F, sep = "")
    d2 <- read.csv(file2, header = F, sep = "")
    d <- rbind(d1, d2)
    write.table(d, file = fileCombined, quote = F, row.names = F, col.names = F, sep = " ")
}

## ---------------------
## 2) Extracts only the measurements on the mean and standard deviation for each measurement
## ---------------------
features <- read.csv("./features.txt", sep = " ", header = F)
colnames(features) <- c("col", "feature")
features$feature <- as.character(features$feature)

meanCols   <- grep("-mean()", features$feature, fixed = T)
stdDevCols <- grep("-std()",  features$feature, fixed = T)
filterCols <- sort(c(meanCols, stdDevCols))
filterColNames <- features$feature[filterCols]

data <- read.csv("./combined/X.txt", sep = " ", header = F)
data <- data[,filterCols]
colnames(data) <- filterColNames

activities <- read.csv("./combined/Y.txt", header = F)
activityLabels <- read.csv("./activity_labels.txt", sep = " ", header = F)
colnames(activities) <- c("code")
colnames(activityLabels) <- c("code", "activity")
activities <- merge(activities, activityLabels, by = "code")

## ---------------------
# Assign the activity name to the data frame
## ---------------------
data <- cbind(activities$activity, data)
data <- rename(data, c("activities$activity" = "activity"))
