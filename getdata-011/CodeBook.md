# Code Book


## Analysis description

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


## Data variables

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

