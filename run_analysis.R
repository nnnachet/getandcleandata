library(dplyr)

features <- read.table("features.txt", col.names = c("n","functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_train <- read.table("X_train.txt", col.names = features$functions)
x_test <- read.table("X_test.txt", col.names = features$functions)
y_train <- read.table("train/y_train.txt", col.names = "code")
y_test <- read.table("test/y_test.txt", col.names = "code")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")

xData <- rbind(x_train, x_test)
yData <- rbind(y_train, y_test)
subject <- rbind(subject_test, subject_train)

mergedData <- cbind(subject,yData, xData)

mean_SD <- mergedData %>% select(subject, code, contains("mean"), contains("std"))

mergedData$code <- activities[mergedData$code,2]

names(mergedData)[2] = "activity"
names(mergedData)<-gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData)<-gsub("Gyro", "Gyroscope", names(mergedData))
names(mergedData)<-gsub("BodyBody", "Body", names(mergedData))
names(mergedData)<-gsub("Mag", "Magnitude", names(mergedData))
names(mergedData)<-gsub("^t", "Time", names(mergedData))
names(mergedData)<-gsub("^f", "Frequency", names(mergedData))
names(mergedData)<-gsub("tBody", "TimeBody", names(mergedData))
names(mergedData)<-gsub("-mean()", "Mean", names(mergedData), ignore.case = TRUE)
names(mergedData)<-gsub("-std()", "STD", names(mergedData), ignore.case = TRUE)
names(mergedData)<-gsub("-freq()", "Frequency", names(mergedData), ignore.case = TRUE)
names(mergedData)<-gsub("angle", "Angle", names(mergedData))
names(mergedData)<-gsub("gravity", "Gravity", names(mergedData))


FinalData <- mergedData %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))

write.table(FinalData, "FinalData.txt", row.names = FALSE)

