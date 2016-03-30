run_analysis <- function() {

# I only did this once.
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "CleanData.zip")    
# and added dateDownloaded once:
# dateDownloaded <- date()
        
#
# I manually unzipped.
#
                
#
# Read all test data files from the unzipped folder structure
#
                
X_test <- read.table("CleanData/UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("CleanData/UCI HAR Dataset/test/subject_test.txt") 
y_test <- read.table("CleanData/UCI HAR Dataset/test/y_test.txt")

#        
# Read all train data files from the unzipped folder structure
#

X_train <- read.table("CleanData/UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("CleanData/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("CleanData/UCI HAR Dataset/train/y_train.txt")

#        
# Read miscellaneous data files from the unzipped folder structure
#

features <- read.table("CleanData/UCI HAR Dataset/features.txt")

#
# Add Column names for Subject and Activity
#

colnames(subject_test) <- "Subject"
colnames(y_test) <- "Activity"
colnames(subject_train) <- "Subject"
colnames(y_train) <- "Activity"

#
# Merged the Subject and Activity rows for both Train and Test data
#

test_col1 <- rbind(subject_test,subject_train)
test_col2 <- rbind(y_test,y_train)
test_cols <- cbind(test_col1,test_col2)

# 
# Cleaned up interim objects 
#

rm(subject_test)
rm(subject_train)
rm(y_test)
rm(y_train)
rm(test_col1)
rm(test_col2)

#
# Since there are only 6 activities I hard coded the conversion for data in the Activities
# column from number to English
#

for (i in 1:nrow(test_cols)) {
        if (test_cols$Activity[i] == "1") {test_cols$Activity[i] <- "WALKING"}
        if (test_cols$Activity[i] == "2") {test_cols$Activity[i] <- "WALKING_UPSTAIRS"}
        if (test_cols$Activity[i] == "3") {test_cols$Activity[i] <- "WALKING_DOWNSTAIRS"}
        if (test_cols$Activity[i] == "4") {test_cols$Activity[i] <- "SITTING"}
        if (test_cols$Activity[i] == "5") {test_cols$Activity[i] <- "STANDING"}
        if (test_cols$Activity[i] == "6") {test_cols$Activity[i] <- "LAYING"}
}

#
# Now we start on the big data by merging the test and training vectors.
# 

X_all <- rbind(X_test, X_train)

rm(X_test)
rm(X_train)

#
# English column name / variable names are added by converting column numbers 
# to the variable names from the features list.  
#

for (i in 1:nrow(features)) {
        names(X_all)[i] <- paste(features[i,2]) 
}

#
# Then pulled only the columns with "mean" or "std" to final full dataset.     
# but not meanFreq.
#

X_all1 <- X_all[, grep("\\mean|std", colnames(X_all))]
X_all2 <- X_all1[, grep("\\meanFreq", colnames(X_all1), invert = TRUE)]

#
# bind the final vector with the corresponding subject and activity columns.  
#

OneDataSet <- cbind(test_cols, X_all2)

rm(features)
rm(test_cols)
rm(X_all)
rm(X_all1)
rm(X_all2)

#
# Finally, sort the entire thing by subject and activity.  And here is your 
# One Tidy Data Set. 
#

OneDataSet <- OneDataSet[order(OneDataSet[,1], OneDataSet[,2]),]

# 
# And, write it out as txt file to be uploaded to GitHub
#

write.table(OneDataSet,"FullTidyData.txt",row.names = FALSE)




#
# Below this line is for debug only.
#
 


# write.csv(X_all1, "X_all1.csv")
# write.csv(X_all2, "X_all2.csv")

#write.csv(X_all, "X_all.csv")
#write.csv(test_cols,"test_cols.csv")
write.csv(OneDataSet, "OneDataSet.csv", row.names = FALSE)

#
# Now that we have the single tidy set, we group and get averages for each variable
#



}