This is an accompanying note to explain the code in "run_analysis.R"

1. Initially we read into R all the required data which is stored in multiple text files.
activityDF - is a DataFrame that stores the activity labels
features - is a DataFrame that stores labels for measurements taken
test_label - stores the activities
test_subject - stores the ID of the subjects (persons doing the test)
test_data - stores the measurement data

2. As the test_data does not have descriptive names (labels), we give it names from which is aleady stored in "features" DataFrame.

3. We merge Subject and Activity data into 'test_data'.

4-6. We repeat the same process above with the training data. Data files are read into R; training_data is labeled, and then the subject and activites are merged into training_data.

7. Training Data and Test Data are appended into the other and stored in mergedData.

8. We filter mergedData to extract only those measurements with "std", and "mean" in the column names. This is then stored in filterData variable.

9. Activity values are currently factor without descriptive names. We update it with meaningful names.

10. Next we want to create separate data set with only the mean of each measurement. This is achieved by melting the data set and recasting it to have the mean applied for each variables. This data is stored in tidyData variable.

11. The tidy data is then saved to a text file called "tidyData.txt"
#
