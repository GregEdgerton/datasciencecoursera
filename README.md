# CleaningDataAssignment

This project was meant to create Tidy dataset out of a managerie of many accumulated files from SmartPhone testing. 
Data is all available on single zip file:  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
More info on the data files themselves can be found at: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
File is downloaded and a downloaddate is set.     
For this project the data manually unzipped.
The remaining steps are run and documented in the run_analysis.R script.  
Get data into R:
1)  Read all test data files from the unzipped folder structure
2)  Read all train data files from the unzipped folder structure
3)  Read miscellaneous data files from the unzipped folder structure
Build out matrix for Subject and Activity:
4)  Add Column names for Subject and Activity
5)  Merge the Subject and Activity rows for both Train and Test data
6)  Convert Activities column values to actual activity based on the corresponding numbers (since there were only 6 values, I did this with 6 hardcoded 'If' statements)   
Now we start on the big vectors of data by merging the test and training data.
7)  Added English variable/column names for all 561 variables in the vectors from the supplied features file  
8)  Then pulled only the columns with "mean" or "std" (but not meanFreq) to the final full dataset     
Final full vector data set:
9)  Then did cbind to combine  the final vector with the corresponding subject and activity columns.  
10)  And, sorted the entire thing by subject and activity.  
Final step is to get Tidy Data Set at Subject and Activity level  
11)  Grouped by subject and activity  
12)  Summarized for every remaining variable
13)  Write out final Tidy file. 
All code, documentation and the final Tidy Data Set are available on GitHub. 
