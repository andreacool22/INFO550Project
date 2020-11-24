# My Project Summary
For my project, I will be analyzing deidentified data on antibiotic starts from three nursing home facilities. The following files are included in this repository:

     - packages.r : This is the R code to download the necessary R packages for this analysis
     - Cool_Project_RawData.csv : This is the raw data that will be used for the analysis
     - Cool_Project_Cleandata.R : This is the R code for cleaning the data
     - make_fig1.R : This is the R code for making a bar graph that will be included in the final report
     - Cool_Project_Report.Rmd : This is the R markdown file for generating the final report
     - Makefile : This is the makefile which contains the rules for installing packages and generating the report
     - Dockerfile: This is the Docker File that will be used to build the docker container

## Execute in Docker (Homework 7)
To execute this analysis in Docker, first use the following command to pull the docker image:
``` bash       
docker pull andreacool22/info550
```   

Next, to generate the final report, you will need to run the following command to mount your local directory to the directory in the container:

``` bash       
docker run -v /local_path:/project/output andreacool22/info550
```   
NOTE: Be sure to replace "local_path" with the path to your local directory where you want the output to be saved (e.g., docker run -v /Users/andreacool/Documents:/project/output andreacool22/info550 )

This command will generate the final report titled "Cool_Project_Report.html" in the local directory that you specified in the previous step.

## Execute using Make

First, you will need to fork and clone this repository into a local directory. 

Next, for this analysis, you will need the following R packages:
     
     - dplyr
     - tidyverse
     - lubridate
     - table1

To install these packages to your computer, from the project folder you can run the following bash code:
``` bash       
make install
```   
To generate the report, from the project folder you can run the following bash code:

``` bash       
make report
```   

This makefile will install the necessary R packages, clean the data, generate a bar graph, and create a file called Cool_Project_Report.html output in your directory that contains the results of the analysis.

For information about the rules in the Makefile, you can run the following bash code from the project folder:
``` bash       
make help
``` 

To clean up the working directory, you can run the following bash code from the project folder:
``` bash       
make clean
``` 
