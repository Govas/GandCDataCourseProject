### How to use the run_analysis.R script
The run_analysis.R script process some data taken from the UCI Machine Learning Repository, take a look:
[Data Set]("http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones")
And it creates a text file with a tidy Data set of these Data Set(s).

#### Libraries used
- R and/or RStudio 3.0.2 or above
- You need "data.table" library in order for this script to work, use install.packages("data.table")

####The steps for using this script are the following.
- In the Console type source("run_analysis.R"), this will download the data required and write a text file with the processed data
- Finally type data <- read.table("tidyDataSet.txt") and View(data) and then you can use the data variable for any purpose

by Govs, September 2014