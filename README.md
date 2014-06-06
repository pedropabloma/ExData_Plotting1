## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


Structure of the original data

The original data provide measurements of electric power consumption in one household with a one-minute sampling rate (thus 1440 measurements per day) over a period of almost 4 years (Between Dec. 2006 to Nov. 2010). Different electrical quantities and some sub-metering values are available.

The file downloaded from the link above has been unzipped first, resulting in a txt file named household_power_consumption.txt of size 142.7 Mb, subsequently explored first on RStudio.

Loading the original unzipped data can take some time as shown below

User     system      elapsed
23.634     0.423     24.062
The full data set has 2,075,259 rows and 9 columns separated by semicolons:

Date: Date in format dd/mm/yyyy
Time: time in format hh:mm:ss
Global_active_power: household global minute-averaged active power (in kilowatt)
Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
Voltage: minute-averaged voltage (in volt)
Global_intensity: household global minute-averaged current intensity (in ampere)
Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
Reading the original data

As we will only be using data from dates 1/2/2007 and 2/2/2007, and to avoid the relatively long time and big memory required to read the full data, I imported them only once in RStudio and explored what are the rows that I need to reproduce the required plots. Thus, in all the R codes included in this repository, I read the data file using read.csv with appropriate skip and nrow arguments.

An initial inspection of the full data on RStudio shows that they are already clean and ordered by Date and Time. All I had to do then is to find the index of the first occurence of the date 1/2/2007 and the last occurence of the date 2/2/2007. The former is 66637 and the latter is 69516 resulting in 2880 rows of interest as expected for a 2-day period (2x1440).

Thus, in the R codes provided, I read the original data with the arguments skip = 66636 and nrow = 2880. This results in a much lower reading time as shown below

User     system      elapsed
0.543     0.005       0.548
It is the structure of the full data which allowed me to do this simple analysis of how to read the relevent rows needed for the course project in a reasonable time. The approach is not the most elegant one but it is sufficient to reproduce what is required. My way would be problematic if the original data set is changed for a reason or another.


Once the reduced data set is read, the Date and Time columns are merged into a single column named datetime in POSIXlt format using the function strptime(). Finally, I subset the reduced data set to the needs of each plot and bind it column-wise with datetime. E.g.: in plot 2, I only need the data on the time evolution of the Global Active Power, so I re-asign the original data.frame data to include only the datetime column and the column data$Global_active_power = data[,3].

## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


### Plot 1


![plot of chunk unnamed-chunk-2](plot1.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](plot2.png) 


### Plot 3

![plot of chunk unnamed-chunk-4](plot3.png) 


### Plot 4

![plot of chunk unnamed-chunk-5](plot4.png) 

