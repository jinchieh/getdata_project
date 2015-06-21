---
title: "README.md"
output: markdown
---

Download Zipfile from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Unzip the file into the working directory, making sure the folder "getdata-projectfiles-UCI HAR Dataset" exists.

The script run_analysis.R will run in R, and creates two datasets, myData & myData2. myData contains all the measurements that are means and standard deviations, for every subject and every activity. Each subject and activity can have multiple values for the same measurement.

myData2 takes the values for each measurement in myData, and averages them based on each unique subject and activity.