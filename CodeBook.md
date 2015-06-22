Here's a description of the variable names in the R script (run_analysis.R):

	filenames:		list of files in the training and test data sets
	
	features:		data frame with contents of the features.csv file
	meanCols:		column indices containing the keyword "-mean()" in it
	stdDevCols:		column indices containing the keyword "-std()" in it
	filterCols:		combined list of mean and stdDev cols
	filterColNames:	column names of the filterCols list above
	
	data:			master data of all variables in observations
	
	activities:		master data of activities in observations
	
	activityLabels:	data frame containing a mapping of activity labels to activity numbers
	
	subjects:		master data of subjects corresponding to observations
	
	outputData:		final output data showing the average of the selected variables by subject and activity
