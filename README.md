All the R code is in the run_analysis.R file.

The code does the following steps:

1) Merge the training and the test sets to create one data set. Put the results in a folder called "./combined". Create a list of file names, and then combine all of them in a loop

2) Extract only the measurements on the mean and standard deviation for each measurement. Filter on column names using grep(). Clean-up the column names to remove parenthesis and replace dashes with underscores.

3) Assign the activity name to the data frame. Read the activities and then combine it with the data frame.

4) Get the subjects and assign them to each of the rows in the cOmbined data set. Read the subjects and then combine it with the data frame.
	
5) Summarize the variables by subject & activity. Using ddply() from the plyr package.
