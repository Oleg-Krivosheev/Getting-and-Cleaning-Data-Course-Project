# Project to fulfill requirements for Coursera "Getting and Cleaning Data" course

The project for course [Getting and Cleaning Data](https://www.coursera.org/course/getdata) was to develop **R** script, Readme and Code Book to
perform data transformation and produce tidy dataset for further analysis.

Project task and original dataset were described in the ["Human Activity Recognition Using Smartphones"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Requirements

0. **R** version 3 or higher
1. *data.table* package, which could be found [here](https://github.com/Rdatatable/data.table/).

## Tested with

0. **R** v3.1.2 64bit running on Ubuntu Linux v15.04
1. *data.table* package v1.9.6

## Steps required to execute the script:

0. Script name is [run_analysis.R](run_analysis.R)
1. If data are already downloaded, lines 4 to 7 of the script could be commented out to save time and bandwidth
2. In the terminal, start **R**
3. Source the script

## Expected Output

Once script runs, a tidy data set will be generated, see [tidy.csv](tidy.csv).

## Additional Information

More information wrt the data could be found in the [Code Book](CodeBook.md).
