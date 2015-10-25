# Code Book

This Code Book described the data used in the project, as well as the processing steps, which were implemented to generate the resulting tidy data set.

## Data Overview

30 volunteers (a.k.a. subjects) performed 6 different activities while wearing a smartphone. The smartphone captured and stored various data regarding their movements.

## Measurement Files Description

* `activity_labels.txt`: The complete list of activity labels, total of the 6.
* `features.txt`: The complete list of variables of each feature vector, total of 561.

* `X_test.txt`: total 2947 observations of the 561 features, performed by  9 out of the 30 volunteers.
* `y_test.txt`: An integer vector of 2947 activities, one per each observation in the `X_test.txt`.
* `subject_test.txt`: An integer vector of 2947 integers, each one is the ID of the volunteer performing particular test/observation in the `X_test.txt`.

* `X_train.txt`: total 7352 observations of the 561 features, performed by 21 out of the 30 volunteers.
* `y_train.txt`: An integer vector of 7352 activities, one per each observation in the `X_train.txt`.
* `subject_train.txt`: An integer vector of 7352 integers, each one is the ID of the volunteer performing particular test/observation in the `X_train.txt`.

More information is available in the distribution files `features_info.txt` and `README.txt`.

## Data Processing Steps

0. Data archive to be downloaded, saved locally and unzipped.
1. All data files described above were read into data tables. Reason for use data tables, beyond better API, is simple - reading takes approx. 34sec with data frames and 5.4sec using fread and data.tables. After reading all column names are set from features text file. Test and training data tables were combined into single data table.
2. Columns which names do not contain either "mean()" or "std()" were removed. Note, that column removal was based upon full functional name. As a result we produced
data table with 33 mean columns and 33 std.deviation columns. Activity and subject id columns were added.
3. The activity column was converted, using `activity_labels.txt`, from a integer to a string label.
4. We produced tidy data set with mean value of every feauture per subject and activity.
5. Tidy data table was saved as Comma-Separated-Values into a CSV file. CSV was made to conform to the [IETF RFC4180](https://tools.ietf.org/html/rfc4180) specification for CSV files
