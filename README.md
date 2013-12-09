The processed data for this project are the Samsung activity data available from the link below:
https://spark-public.s3.amazonaws.com/dataanalysis/samsungData.rda

These data are slightly processed to make them easier to load into R. 
You can also find the raw data here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

All of the columns of the data set (except the last two) represents one measurement from the Samsung phone. The variable subject indicates which subject was performing the tasks when the measurements were taken. The variable activity tells what activity they were performing.

The goal of this project is to build a function that predicts what activity a subject is performing based on the quantitative measurements from the Samsung phone. For this analysis the training set must include the data from subjects 1, 3, 5, and 6.  But more subjects data may be used to train if needed. The test set is the data from subjects 27, 28, 29, and 30, but more data may be used to test. The training/test sets must not overlap.
