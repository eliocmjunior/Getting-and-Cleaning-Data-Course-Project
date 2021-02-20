# Getting-and-Cleaning-Data-Course-Project
Final assignment for the course Getting and Cleaning Data Course provided by Johns Hopkins University through Coursera
Contains R code ('run_analysis.R'), codebook ('CodeBook.md'), and tidy data set ('tidyset.txt') for the assignment.

# About the data source
 Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors

1. All measurements are floating-point values, normalised and bounded within [-1,1]
2. The 30 subjects performed 6 measured activities as following:
  * Walking
  * Walking upstairs
  * Walking downstairs
  * Sitting
  * Standing
  * Laying

# About the code
File 'run_analysis.R' contains all the R code used to generate the tidy data presented on 'tidyset.txt'.
Five steps performed by the code:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each  
  variable for each activity and each subject.

# About the result
File 'tidyset.txt' is a plain text file with 68 columns separated by spaces and 181 rows but the first
row is header.
