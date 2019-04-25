## Code Book

Download the dataset and unzip into current working directory

Assign names and variables to data and tables.
	
	features: 
		561 rows, 2 columns
		contains the variable names for the data and identifying numbers
	activities: 
		6 rows, 2 columns
		contains list of activities performed and corresponding codes
	subject_test:
		2947 rows, 1 columns
		unique identifier column for participants in test data
	subject_train
		7352 rows, 1 columns
		unique identifier column for participants in training data
	x_train
		7352 rows, 561 columns
		training data of each variable/feature
	x_test
		2947 rows, 561 columns
		test data of each variable/feature
	y_train
		7352 rows, 1 column
		column of training participant identifiers 
	y_test
		2947 rows, 1 column
		column of test participant identifiers 

Merge Data Sets
	xData 
		10299 rows, 561 columns
		Created using rbind(). Dataset containing merged x_train and x_test
	yData
		10299 rows, 1 column 
		Created using rbind(). Dataset containing merged y_train and y_test
	subject
		10299 rows, 1 column
		Created using rbind(). Dataset containing merged subject_train and subject_test
	mergedData
		10299 rows, 563 columns
		Created using cbind(). Dataset containing merged yData, xData and subject


Extracts only measurements
	mean_SD
		10299 rows, 88 columns
		created using select() to extract columns containing mean and sd 

Use descriptive activity names to name activities.
	Assign code column in mergedData to second column in activities.


Label the data set with descriptive variable names
	Activities column is renamed
	Various abbreviations and indicators are replaced

Create final data set with average variable for each subject and activity.
	Final Data 
		180 rows by 563 columns
		Created using groupby() and summarise_all() with the mean() function.
		Exported to txt file using write.table().