# Codebook for the week 3 Getting and Cleaning Data Project

## Preparation

Firstly you will need to download the Smartphone Recognition dataset.  A description can be found here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

To prepare the tidy dataset:
```
curl https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip > Dataset.zip
unzip Dataset.zip

# Run the script:
Rscript run_analysis.R
```

## Output

The script will output two files:
* `tidy.txt`: A Tidy output of mean and standard deviations of the observations (This was assumed to be all observations that ended -mean() or -std() in the original data set

* `subject_averages.txt`: The averages for each subject and activity for each variable.

## Tidy.txt columns
The headers are in the first line of the output.  To analyse further with R run
```
read.table('tidy.txt', header=TRUE)
```

* `activity_id` Numeric representation of the below activities
* `VARIABLE.std...[?DIRECTION]`: The standard deviation of the variables described in UCI\ HAR\ Dataset/features_info.txt
* `VARIABLE.mean...[?DIRECTION]`: The mean of the variables describled in UCI\ HAR\ Dataset/features_info.txt
* `subject`: Integer denoting the different subjects carrying out the experiments
* `activity`:  Factor w/ 6 levels: LAYING, SITTING, STANDING, WALKING WALKING_DOWNSTAIRS, WALKING_UPSTAIRS


## subject_averages.txt columns
This table gives the average of each of the above variables (same name) for each subject and activity

The headers are in the first line of the output.  To analyse further with R run
```
read.table('summary_averages.txt', header=TRUE)
``` 

