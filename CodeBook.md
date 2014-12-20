CodeBook for run_analysis.R
===========================
This code is used to extract the means and standard deviations of values recorded using a Samsung device while
volunteers were performed six activities (walking, walking uptairs, walking downstairs, sitting, standing, and laying).   
The large Samsung dataset was downloaded can be downloaded here: [LINK](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
**Please note that the I set my working directory in R as UCI HAR Dataset**   
The folder UCI HAR Dataset should also contain other files essential to succesfully running this code.  
In this folder there should be two subfolders: test and train.  
Each folder contains three important files: X, Y, and Z.   
* X = contains all the data recordings  
* Y = contains which activity was performed per recording  
* subject = contains which subject was perfroming the activity   

The codes runs the following lines:
  * It reads the files in the test folder: X_test.txt, Y_test.txt, subject_test.text and saves these data sets in variables: **testXdata**, **testYdata**, and **testsubject**, respectively.
  * From the main folder, the code reads features.txt and extracts the values containing mean or (std). These values are saved in variables **columnnames, columnnumbers**.
  * These values will used to extract the columns containing information relating the the mean and std from Xtest and Xtrain.
  * The subset of columns containing the mean and std are extracted and saved in the variable **subsetXtest**.
  * The column containing the numbers representing each subject is added using cbind and saved as **subsetXYtest**.
  * The previous datasets are deleted and gc() is used to clear some of the memory allocated to these large files. 
  * The columns are labelled using the values in **columnnames**.
  * The previous steps are repeated for the train dataset. 
  * The values in both data sets are combined using rbind and saved in the variable named **combined**.
  * The values in the activity column are replaced by factors labelled as walking, walking uptairs, walking downstairs, sitting, standing, or laying.
  * The data is summarized using the aggregate function to calculate the mean of the rest of the columns in respect to the columns subjects and activity.
  * The summarized data is saved as variable **summarydata**.
  


