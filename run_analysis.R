# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Make sure the folder "getdata-projectfiles-UCI HAR Dataset" is in the working directory.

#Load the Libraries
library(data.table)

#Read the files
subject_test <- stack(read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep=""))
x_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep="")
y_test <- stack(read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", sep=""))
testing <- as.data.frame(cbind(subject_test[,1],y_test[,1],x_test))
names(testing)[1:2] <- c("subject","activity")
subject_train <- stack(read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep=""))
x_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep="")
y_train <- stack(read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", sep=""))
training <- as.data.frame(cbind(subject_train[,1],y_train[,1],x_train))
names(training)[1:2] <- c("subject","activity")

#Combine the testing and training sets into one dataset
myData <- rbind(testing,training)

#Giving appropriate descriptions to all variables and factors
names <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt",sep="")
names(myData)[3:563] <- as.character(names$V2)
myData$activity <- as.character(myData$activity)
myData$activity[myData$activity == "1"] <- "Walking"
myData$activity[myData$activity == "2"] <- "Walking_Upstairs"
myData$activity[myData$activity == "3"] <- "Walking_Downstairs"
myData$activity[myData$activity == "4"] <- "Sitting"
myData$activity[myData$activity == "5"] <- "Standing"
myData$activity[myData$activity == "6"] <- "Laying"

#Make activity and subject as factors
myData$activity <- as.factor(myData$activity)
myData$subject <- as.factor(myData$subject)

#Subset only the measurements that are mean and standard deviations
myData <- myData[grep("subject|activity|mean\\(\\)|std\\(\\)", names(myData))]

#Create a second dataset based on step 5 requirements
myData2 <- aggregate(. ~ subject + activity, data = myData2, FUN= "mean" )

#Write into new document
write.table(myData2, "getdata_project.txt", row.names=FALSE)
