#!/usr/bin/Rscript --vanilla


# Required libraries
require("dplyr")


# Originally from "toupper" documentation
capwords <- function(s, strict = FALSE) {
    cap <- function(s) paste(toupper(substring(s, 1, 1)),
                             {s <- substring(s, 2); if(strict) tolower(s) else s},
                             sep = "", collapse = " " )
    sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}


# Read a matrix from a file
ReadMatrix <- function(file, col.classes, col.names) {
    file %>%
    read.table(col.names = col.names, colClasses = col.classes,
               comment.char = "") %>%
    return
}

# Read a vector from a file
ReadVector <- function(file, col.classes) {
    file %>%
    read.table(colClasses = col.classes, comment.char = "") %>%
    unlist(recursive = FALSE, use.names = FALSE) %>%
    return
}


# Read feature labels
features <- ReadVector(file = "UCI HAR Dataset/features.txt",
                       col.classes = c("NULL", "character"))

# Select features of interest: "mean()" or "std()"
selected.features <- features %>%
                     grepl(pattern = "(mean|std)\\(\\)")

feature.classes <- rep("NULL", times = length(features))
feature.classes[selected.features] <- "numeric"

# Read and merge feature data
x.train <- ReadMatrix(file = "UCI HAR Dataset/train/X_train.txt",
                      col.names = features, col.classes = feature.classes)
x.test <- ReadMatrix(file = "UCI HAR Dataset/test/X_test.txt",
                     col.names = features, col.classes = feature.classes)
x.data <- bind_rows(x.train, x.test)

# Some checks
stopifnot(ncol(x.train) == ncol(x.test) & ncol(x.test) == ncol(x.data))
stopifnot(nrow(x.train) + nrow(x.test) == nrow(x.data))


# Read activity labels
activities <- ReadVector(file = "UCI HAR Dataset/activity_labels.txt",
                         col.classes = c("NULL", "character")) %>%
              gsub(pattern = "[^[:alnum:]]+", replacement = " ") %>%
              capwords(strict = TRUE)

# Read activity data
y.train <- ReadVector(file = "UCI HAR Dataset/train/y_train.txt",
                      col.classes = c("integer"))
y.test <- ReadVector(file = "UCI HAR Dataset/test/y_test.txt",
                     col.classes = c("integer"))

# Merge and parse activity data
y.data <- activities[combine(y.train, y.test)]

# Some checks
stopifnot(length(y.train) + length(y.test) == length(y.data))


# Read and merge subjects
subject.train <- ReadVector(file = "UCI HAR Dataset/train/subject_train.txt",
                            col.classes = c("integer"))
subject.test <- ReadVector(file = "UCI HAR Dataset/test/subject_test.txt",
                           col.classes = c("integer"))
subject.data <- combine(subject.train, subject.test)

# Some checks
stopifnot(length(subject.train) + length(subject.test) == length(subject.data))

stopifnot(nrow(x.data) == length(y.data) &
          length(y.data) == length(subject.data))


# Feature data tidying
names(x.data) <- names(x.data) %>%
                 gsub(pattern = "Acc", replacement = "Accelerometer") %>%
                 gsub(pattern = "Gyro", replacement = "Gyroscope") %>%
                 gsub(pattern = "Mag", replacement = "Magnitude") %>%
                 gsub(pattern = "std", replacement = "StandardDeviation") %>%
                 gsub(pattern = "^t", replacement = "Time") %>%
                 gsub(pattern = "^f", replacement = "Frequency") %>%
                 gsub(pattern = "([XYZ])$", replacement = "\\1Axis") %>%
                 gsub(pattern = "[^[:alnum:]]+", replacement = " ") %>%
                 capwords %>%
                 gsub(pattern = " ", replacement = "")


# Merge all columns
dataset <- x.data %>%
           bind_cols(data.frame(y.data), data.frame(subject.data)) %>%
           tbl_df
names(dataset) <- c(names(x.data), "Activity", "SubjectID")


# Generate final tidy dataset (mean of groups)
tidy.dataset <- dataset %>%
                group_by(Activity, SubjectID) %>%
                summarise_each(funs(mean))

# Write table
write.table(tidy.dataset, file = "UCI_HAR_Dataset_Tidy.txt", row.name = FALSE)

