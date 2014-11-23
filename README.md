README for Cleaning Data Course Project
=============

Files included in this project:
- run_analysis.R - the code to run
- README.md - the instructions on how to run the code
- Codebook.md - the associated **Code Book** to understand the column names of the output file

run_analysis.R
--------------
To run this file, ensure you have the dplyr and reshape2 libraries installed:  
`install.library("dplyr")`
`install.library("reshape2")`

Once you install those libraries, the code should run without issue.  The libraries are called within the code, so you don't need to call them before you run.

**In addition, the code assumes that the input files are in the default folder created by extracted zip file (UCI HAR Dataset).  Ensure that the input files are in that folder.  The UCI HAR Dataset should be at the same level as the run_analysis.R folder.**

To execute the code, type:
`source("run_analysis.R")`
at the R prompt.  It takes about 20 seconds to run as the data sets are large.  A data_output.txt file is generated in the executable directory.  There is no output to the console.

Code Book
---------
Please see Codebook.md for the description of the column names in the data_output.txt file.
