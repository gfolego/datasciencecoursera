# [Getting and Cleaning Data](https://www.coursera.org/course/getdata)

## Course Project

*The following description has been extracted from the course page.*

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

> One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

> http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

> Here are the data for the project: 

> https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

> You should create one R script called run_analysis.R that does the following.

> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

> Good luck!


## Running the analysis

1. Download and unzip the dataset
    * The directory `UCI HAR Dataset` should be created in the working directory
2. Place the [run_analysis.R](run_analysis.R) script in the working directory
3. Run the script (*e.g.*, `./run_analysis.R`)

The tidy dataset will be saved in a file named `UCI_HAR_Dataset_Tidy.txt` in the working directory.
The code book for the generated dataset is available at [CodeBook.md](CodeBook.md).


## Implementation details

This script requires the [dplyr](http://cran.r-project.org/web/packages/dplyr/index.html) package.
The code makes extensive use of the *chain* (`%>%`) function, so please make yourself familiar with it before proceeding.

For optimized use of processing time and memory space, the steps taken in the analysis do not strictly follow the order in the course project description.
For comparison, simply running `read.table(file = "UCI HAR Dataset/train/X_train.txt")` takes around 25 seconds, whereas **_running the whole script takes less than 5 seconds_**.

The analysis, steps and tidy dataset descriptions are available at [CodeBook.md](CodeBook.md).
Most importantly, the script starts with the assumption that the Samsung data is available in the working directory in an unzipped `UCI HAR Dataset` directory.

In order to read the dataset back into `R`, run the following code:

```R
data <- read.table(file = file_path, header = TRUE)
View(data)
```


## Additional notes

If you still have any [doubt](http://www.imdb.com/title/tt0918927/), before marking, please refer to the [**David's Course Project FAQ**](https://class.coursera.org/getdata-011/forum/thread?thread_id=69) thread in this course session forum.


