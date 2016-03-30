# CodeBook - Cleaning Data

Background
This project was meant to create Tidy dataset out of a managerie of many accumulated files from Samsung SmartPhone testing.
For full explanation of the initial data see:   
"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
For this exercise, the raw data from the Inertial Signals was not used.  For more information how the raw data was used to create the supplied data vectors, read the documentation previously mentioned.  

Our analysis explianed
This analysis was done by combining the two vectors (training and testing) with a combination of 561 variables and 10299 observations. And, adding the variable names and labels (Subject and Activity) for all.
This analysis then only looked at variables for mean or standard deviations, which reduced the total variables from 561 to 66 for our analysis.  
Data was then all grouped by Subject (30) and Activity (6) to give us a Tidy version of a single occurrence of each observation and gave an average for each Activity per Subject for every mean or standard deviation variable.  Reducing the observances from 10299 to 180.         
Resulting data is the average for each of the 66 variables, per 180 observance, (which is rolled up to the Subject and Activity level).      

