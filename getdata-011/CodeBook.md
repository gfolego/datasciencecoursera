# Code Book

## Feature description

*The following description has been extracted from the dataset.*

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> The set of variables that were estimated from these signals are: 
+ mean(): Mean value
+ std(): Standard deviation


## Analysis description

The [run_analysis.R](run_analysis.R) script starts with the assumption that the Samsung data is available in the working directory in an unzipped `UCI HAR Dataset` directory.

The analysis is performed following the steps below:

1. **Parse feature labels**
    1. Read feature labels file (`features.txt`)
    1. Select only those that have `mean()` or `std()` in the name (68 features in total)
1. **Read feature data**
    1. For each `X_<dataset>.txt`
        1. Read only the selected features
        1. Name columns accordingly (simultaneously)
    1. Merge `X` data
1. **Parse activity labels**
    1. Read activity labels file `activity_labels.txt`
    1. Replace special characters with space
    1. Convert names to [Camel Case](http://en.wikipedia.org/wiki/CamelCase)
1. **Read activity data**
    1. For each `y_<dataset>.txt`
        1. Read data
    1. Merge `y` data
    1. Convert activity indices to labels
1. **Read subject data**
    1. For each `subject_<dataset>.txt`
        1. Read data
    1. Merge subject data
1. **Data tidying**
    1. Perform some substitutions to improve column names (and apply [Camel Case](http://en.wikipedia.org/wiki/CamelCase))
    1. Merge feature, activity and subject data
    1. Group by activity and subject (in this order)
    1. Calculate the mean value of each group
    1. Finally, the generated dataset is saved to a file

The tidy dataset will be saved in a file named [UCI_HAR_Dataset_Tidy.txt](UCI_HAR_Dataset_Tidy.txt) in the working directory.


## Data variables

- Variable `Activity` is of class `character` and `SubjectID` is of class `integer`.
- All the other variables are of class `numeric`.
- `Activity` is one of: Laying, Sitting, Standing, Walking, Walking Downstairs, Walking Upstairs.
- `SubjectID` is a number between 1 and 30.
- Variable name transformations are performed in [lines 98-109 of run_analysis.R](run_analysis.R#L98-L109). The resulting names should be straightforward to understand, given the [feature description](#feature-description) above. Please keep in mind that the values are actually the average of each variable for each activity and each subject, as described in the [project description](README.md#course-project).

The variables are presented in the [UCI_HAR_Dataset_Tidy.txt](UCI_HAR_Dataset_Tidy.txt) in the following order, with their respective names:

1. Activity
1. SubjectID
1. TimeBodyAccelerometerMeanXAxis
1. TimeBodyAccelerometerMeanYAxis
1. TimeBodyAccelerometerMeanZAxis
1. TimeBodyAccelerometerStandardDeviationXAxis
1. TimeBodyAccelerometerStandardDeviationYAxis
1. TimeBodyAccelerometerStandardDeviationZAxis
1. TimeGravityAccelerometerMeanXAxis
1. TimeGravityAccelerometerMeanYAxis
1. TimeGravityAccelerometerMeanZAxis
1. TimeGravityAccelerometerStandardDeviationXAxis
1. TimeGravityAccelerometerStandardDeviationYAxis
1. TimeGravityAccelerometerStandardDeviationZAxis
1. TimeBodyAccelerometerJerkMeanXAxis
1. TimeBodyAccelerometerJerkMeanYAxis
1. TimeBodyAccelerometerJerkMeanZAxis
1. TimeBodyAccelerometerJerkStandardDeviationXAxis
1. TimeBodyAccelerometerJerkStandardDeviationYAxis
1. TimeBodyAccelerometerJerkStandardDeviationZAxis
1. TimeBodyGyroscopeMeanXAxis
1. TimeBodyGyroscopeMeanYAxis
1. TimeBodyGyroscopeMeanZAxis
1. TimeBodyGyroscopeStandardDeviationXAxis
1. TimeBodyGyroscopeStandardDeviationYAxis
1. TimeBodyGyroscopeStandardDeviationZAxis
1. TimeBodyGyroscopeJerkMeanXAxis
1. TimeBodyGyroscopeJerkMeanYAxis
1. TimeBodyGyroscopeJerkMeanZAxis
1. TimeBodyGyroscopeJerkStandardDeviationXAxis
1. TimeBodyGyroscopeJerkStandardDeviationYAxis
1. TimeBodyGyroscopeJerkStandardDeviationZAxis
1. TimeBodyAccelerometerMagnitudeMean
1. TimeBodyAccelerometerMagnitudeStandardDeviation
1. TimeGravityAccelerometerMagnitudeMean
1. TimeGravityAccelerometerMagnitudeStandardDeviation
1. TimeBodyAccelerometerJerkMagnitudeMean
1. TimeBodyAccelerometerJerkMagnitudeStandardDeviation
1. TimeBodyGyroscopeMagnitudeMean
1. TimeBodyGyroscopeMagnitudeStandardDeviation
1. TimeBodyGyroscopeJerkMagnitudeMean
1. TimeBodyGyroscopeJerkMagnitudeStandardDeviation
1. FrequencyBodyAccelerometerMeanXAxis
1. FrequencyBodyAccelerometerMeanYAxis
1. FrequencyBodyAccelerometerMeanZAxis
1. FrequencyBodyAccelerometerStandardDeviationXAxis
1. FrequencyBodyAccelerometerStandardDeviationYAxis
1. FrequencyBodyAccelerometerStandardDeviationZAxis
1. FrequencyBodyAccelerometerJerkMeanXAxis
1. FrequencyBodyAccelerometerJerkMeanYAxis
1. FrequencyBodyAccelerometerJerkMeanZAxis
1. FrequencyBodyAccelerometerJerkStandardDeviationXAxis
1. FrequencyBodyAccelerometerJerkStandardDeviationYAxis
1. FrequencyBodyAccelerometerJerkStandardDeviationZAxis
1. FrequencyBodyGyroscopeMeanXAxis
1. FrequencyBodyGyroscopeMeanYAxis
1. FrequencyBodyGyroscopeMeanZAxis
1. FrequencyBodyGyroscopeStandardDeviationXAxis
1. FrequencyBodyGyroscopeStandardDeviationYAxis
1. FrequencyBodyGyroscopeStandardDeviationZAxis
1. FrequencyBodyAccelerometerMagnitudeMean
1. FrequencyBodyAccelerometerMagnitudeStandardDeviation
1. FrequencyBodyBodyAccelerometerJerkMagnitudeMean
1. FrequencyBodyBodyAccelerometerJerkMagnitudeStandardDeviation
1. FrequencyBodyBodyGyroscopeMagnitudeMean
1. FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation
1. FrequencyBodyBodyGyroscopeJerkMagnitudeMean
1. FrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation

