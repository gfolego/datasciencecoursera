# [Getting and Cleaning Data](https://www.coursera.org/course/getdata)

## Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!


## Running the analysis

1. Download and unzip the dataset
    * The directory `UCI HAR Dataset` should be created in the working directory
2. Place the [run_analysis.R](run_analysis.R) script in the working directory
3. Run the script (*e.g.*, `./run_analysis.R`)

The tidy dataset will be saved in a file named `UCI_HAR_Dataset_Tidy.txt`.
The code book for the generated dataset is available at [CodeBook.md](CodeBook.md).


## Implementation details

This script requires the [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html) package.
This script makes extensive use of the *chain* (`%>%`) function, so please make yourself familiar with it before proceeding.

For optimized use of processing time and memory space, the steps taken in the analysis do not strictly follow the order in the course project description.
For comparison, simply running `read.table(file = "UCI HAR Dataset/train/X_train.txt")` takes around 25 seconds, whereas running the whole script takes less than 5 seconds.

The analysis is briefly described below:


**Parse feature labels**

1. Read feature labels file (`features.txt`)
2. Select only those that have `mean()` or `std()` in the name


**Read feature data**

3. For each `X_<dataset>.txt`
    1. Read only the selected features
    2. Name columns accordingly (simultaneously)
4. Merge `X` data


**Parse activity labels**

5. Read activity labels file `activity_labels.txt`
6. Replace special characters with space
7. Convert names to [Camel Case](http://en.wikipedia.org/wiki/CamelCase)


**Read activity data**

8. For each `y_<dataset>.txt`
    1. Read data
9. Merge `y` data
10. Convert activity indices to labels


**Read subject data**

11. For each `subject_<dataset>.txt`
    1. Read data
12. Merge subject data


**Data tidying**

13. Perform some substitions to improve column names
14. Merge feature, activity and subject data
15. Group by activity and subject (in this order)
16. Calculate the mean value of each group
17. Finally, the generated dataset is saved to a file



In order to read the dataset back into `R`, run the following code:

```R
data <- read.table(file_path, header = TRUE)
View(data)
```


## Additional notes

If you still have any [doubt](http://www.imdb.com/title/tt0918927/), before marking, please refer to the [**David's Course Project FAQ**](https://class.coursera.org/getdata-011/forum/thread?thread_id=69) thread in this session forum.


