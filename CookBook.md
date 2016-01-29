#CookBook
_`This is a code book that describes the variables, the data, and any transformations or work that were performed to clean up the data`_

###Variables
#####subject:
* `unique number 1 to 30`

#####activity_labels:
* `WALKING`
* `WALKING_UPSTAIRS`
* `WALKING_DOWNSTAIRS`
* `SITTING`
* `STANDING`
* `LAYING`

#####features:

Signals | Estimated from signals | Obtained by averaging siginals
--------------------|--------------| ------------------
`tBodyAcc-XYZ`     | `mean()`       | `gravityMean`	
`tGravityAcc-XYZ`  | `std()`        | `tBodyAccMean`
`tBodyAccJerk-XYZ` | `mad()`        | `tBodyAccJerkMean`
`tBodyGyro-XYZ`    | `max()`        | `tBodyGyroMean`	
`tBodyGyroJerk-XYZ`| `min()`        | `tBodyGyroJerkMean` 
`tBodyAccMag`      | `sma()`	      |                    
`tGravityAccMag`   | `energy()`     |                    
`tBodyAccJerkMag`  | `iqr()`	      |                    	
`tBodyGyroMag`     | `entropy()`    |                    
`tBodyGyroJerkMag` | `arCoeff()`    |                    
`fBodyAcc-XYZ`     | `correlation()`|                    
`fBodyAccJerk-XYZ` | `maxInds()`    |                    
`fBodyGyro-XYZ`    | `meanFreq()`   |                    
`fBodyAccMag`      | `skewness()`   |                   
`fBodyAccJerkMag`  | `kurtosis()`   |                    	
`fBodyGyroMag`     | `bandsEnergy()`|                    
`fBodyGyroJerkMag` | `angle()`      |                    	


* `Prefix 't' to denote time; captured at a constant rate of 50 Hz`
* `Body and graviy acceleration siginals:tBodyAcc-XYZ and tGravityAcc-XYZ`
* `Jerk signals:tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ`
* `Euclidean norm:tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag`
* `FFT:Fast Fourier Transform`
* `Prefix 't' to indicate frequency domain signals`
* `'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.`

###Data
* **README.txt**
* **features_info.txt**: `Explains the variables are used in the features`
* **features.txt_: `Contains a list of all the features.`
* **activity_labels.txt**: `Contains a list of all the activities.`
* **subject_train.txt**: `Contains a list of unique number that is assigned to each subect in test.`
* **subject_train.txt**: `Contains a list of unique number that is assigned to each subect in training.`
* **train/X_train.txt**: `Contains training dataset.`
* **train/y_train.txt**: `Contains training labels.`
* **test/X_test.txt**: `Contains test dataset.`
* **test/y_test.txt**: `Contains test labels.`

###Transformations
1. `Merges the training and the test sets to create one data set.`
2. `Extracts only the measurements on the mean and standard deviation for each measurement.`
3. `Uses descriptive activity names to name the activities in the data set.`
4. `Appropriately labels the data set with descriptive variable names.`
5. `From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.`


