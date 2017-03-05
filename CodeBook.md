=======================================================================
Study Design
=======================================================================
The raw data files for this analysis were extracted from the zip file getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip which was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted into the work directory with the following structure:
\UCI HAR Dataset\
\UCI HAR Dataset\train\
\UCI HAR Dataset\train\Inertial Signals\
\UCI HAR Dataset\test\
\UCI HAR Dataset\test\Inertial Signals\
The R script run_analysis.R contains all the processing and transformation steps to take the raw data files to the final datasets. The script reads in 2 primary data sets containing test and training measurements which it eventually merges together after extracting a subset of mean and standard deviation (std) variables, combining them with other datasets containing information on the activity being performed and the subject that the measuremetns were captured from as well as an activity label dataset that provides the labels for the activity being performed.

It is assumed that run_analysis.R will be reside in the top level directory and when executed generates 2 dataset output files in the folder "UCI HAR Dataset" : full_data.csv and summary_data.csv. full_data.csv contains all the full set measures from combing the test and train datasets. summary_data.csv the mean of all the measurements by subject and activity.

The Code Book below describes the variables found in both outputted data sets. The 79 measurements are time domain signal measurements taken in 3 different dimensions X,Y & Z. Only the mean and standard deviation (std) measurements were extracted from the original datasets.

=======================================================================
Code Book
=======================================================================
activitykey	1	integer
	a unique identifier for the activity being peformed with values from 1 to 6. 		
subjectkey	1	integer
	a unique identifer for the subject\person that the measures were captured from.		
tBodyAcc-mean()-X	11	numeric
tBodyAcc-mean()-Y	11	numeric
tBodyAcc-mean()-Z	11	numeric
tBodyAcc-std()-X	11	numeric
tBodyAcc-std()-Y	11	numeric
tBodyAcc-std()-Z	11	numeric
tGravityAcc-mean()-X	11	numeric
tGravityAcc-mean()-Y	11	numeric
tGravityAcc-mean()-Z	11	numeric
tGravityAcc-std()-X	11	numeric
tGravityAcc-std()-Y	11	numeric
tGravityAcc-std()-Z	11	numeric
tBodyAccJerk-mean()-X	11	numeric
tBodyAccJerk-mean()-Y	11	numeric
tBodyAccJerk-mean()-Z	11	numeric
tBodyAccJerk-std()-X	11	numeric
tBodyAccJerk-std()-Y	11	numeric
tBodyAccJerk-std()-Z	11	numeric
tBodyGyro-mean()-X	11	numeric
tBodyGyro-mean()-Y	11	numeric
tBodyGyro-mean()-Z	11	numeric
tBodyGyro-std()-X	11	numeric
tBodyGyro-std()-Y	11	numeric
tBodyGyro-std()-Z	11	numeric
tBodyGyroJerk-mean()-X	11	numeric
tBodyGyroJerk-mean()-Y	11	numeric
tBodyGyroJerk-mean()-Z	11	numeric
tBodyGyroJerk-std()-X	11	numeric
tBodyGyroJerk-std()-Y	11	numeric
tBodyGyroJerk-std()-Z	11	numeric
tBodyAccMag-mean()	11	numeric
tBodyAccMag-std()	11	numeric
tGravityAccMag-mean()	11	numeric
tGravityAccMag-std()	11	numeric
tBodyAccJerkMag-mean()	11	numeric
tBodyAccJerkMag-std()	11	numeric
tBodyGyroMag-mean()	11	numeric
tBodyGyroMag-std()	11	numeric
tBodyGyroJerkMag-mean()	11	numeric
tBodyGyroJerkMag-std()	11	numeric
fBodyAcc-mean()-X	11	numeric
fBodyAcc-mean()-Y	11	numeric
fBodyAcc-mean()-Z	11	numeric
fBodyAcc-std()-X	11	numeric
fBodyAcc-std()-Y	11	numeric
fBodyAcc-std()-Z	11	numeric
fBodyAcc-meanFreq()-X	11	numeric
fBodyAcc-meanFreq()-Y	11	numeric
fBodyAcc-meanFreq()-Z	11	numeric
fBodyAccJerk-mean()-X	11	numeric
fBodyAccJerk-mean()-Y	11	numeric
fBodyAccJerk-mean()-Z	11	numeric
fBodyAccJerk-std()-X	11	numeric
fBodyAccJerk-std()-Y	11	numeric
fBodyAccJerk-std()-Z	11	numeric
fBodyAccJerk-meanFreq()-X	11	numeric
fBodyAccJerk-meanFreq()-Y	11	numeric
fBodyAccJerk-meanFreq()-Z	11	numeric
fBodyGyro-mean()-X	11	numeric
fBodyGyro-mean()-Y	11	numeric
fBodyGyro-mean()-Z	11	numeric
fBodyGyro-std()-X	11	numeric
fBodyGyro-std()-Y	11	numeric
fBodyGyro-std()-Z	11	numeric
fBodyGyro-meanFreq()-X	11	numeric
fBodyGyro-meanFreq()-Y	11	numeric
fBodyGyro-meanFreq()-Z	11	numeric
fBodyAccMag-mean()	11	numeric
fBodyAccMag-std()	11	numeric
fBodyAccMag-meanFreq()	11	numeric
fBodyBodyAccJerkMag-mean()	11	numeric
fBodyBodyAccJerkMag-std()	11	numeric
fBodyBodyAccJerkMag-meanFreq()	11	numeric
fBodyBodyGyroMag-mean()	11	numeric
fBodyBodyGyroMag-std()	11	numeric
fBodyBodyGyroMag-meanFreq()	11	numeric
fBodyBodyGyroJerkMag-mean()	11	numeric
fBodyBodyGyroJerkMag-std()	11	numeric
fBodyBodyGyroJerkMag-meanFreq()	11	numeric
activitydescription	18	Factor
	The description of the activity being performed when the measurement was taken. i.e. SITTING, WALKING, LAYING etc		
