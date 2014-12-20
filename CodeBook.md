CodeBook for run_analysis.R
===========================
This code is used to extract the means and standard deviations of values recorded using a Samsung device while
volunteers were performed six activities (walking, walking uptairs, walking downstairs, sitting, standing, and laying).   
The large Samsung dataset was downloaded from here [LINK](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
**Please note that the I set my working directory in R as UCI HAR Dataset**   
In this folder there should be two subfolders: test and train.  
The folder UCI HAR Dataset should also contain other files essential to succesfully running this code.  
The codes runs the following lines:
  * It reads the files in the test folder: X_test, Y_test, subject_test and saves these data sets in variables: **test_dataX**, **test_dataY**, and **test_subject**, respectively.
  * From the main folder, the code reads features.txt and extracts the values containing mean or (std). These values are saved in variables **column_names, column_numbers**.
  * These values will used to extract the columns containing information relating the the mean and std from X-test and X-train.
  * The new data set containing only the means and stds is saved as **subset_test**.
  * The column containing the number representing each subject is added using cbind and saved as **subset_test_XY**.
  * The previous datasets are deleted and gc() is used to clear some of the memory allocated to these large files. 
  * The columns are labelled using the values in **column_names**.
  * The previous steps are repeated for the train data set. 
  * The values in both data sets are combined using rbind and saved in the variable named **combined_data**.
  * The values in the activity column are replaced by factors labelled as walking, walking uptairs, walking downstairs, sitting, standing, or laying.
  * The data is summarized using the aggregate function to calculate the mean of the rest of the columns in respect to the columns subjects and activity.
  * The summarized data is saved as variable **summarized_data**.
  


