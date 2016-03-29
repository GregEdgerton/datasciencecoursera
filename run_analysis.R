run_analysis <- function(x=1) {

# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "CleanData.zip")    
# manually unzipped.
        
# Push to GitHub.            
        
# Read all test data files
        
X_test <- read.table("CleanData/UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("CleanData/UCI HAR Dataset/test/subject_test.txt") 
y_test <- read.table("CleanData/UCI HAR Dataset/test/y_test.txt")
        
# Read all train data files

X_train <- read.table("CleanData/UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("CleanData/UCI HAR Dataset/train/subject_train.txt")
y_train <- read.table("CleanData/UCI HAR Dataset/train/y_train.txt")

}