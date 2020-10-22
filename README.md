## My Project Summary
For my project, I will be analyzing deidentified data on antibiotic starts from three nursing home facilities. The following files are included in this repository:
    packages.r : This is the R code to download the necessary R packages for this analysis
    Cool_Project_RawData.csv : This is the raw data that will be used for the analysis
    Cool_Project_Cleandata.R : This is the R code for cleaning the data
    make_fig1.R : This is the R code for making a bar graph that will be included in the final report
    Cool_Project_Report.Rmd : This is the R markdown file for generating the final report
    Makefile : This is the makefile which contains the rules for installing packages and generating the report
 
For this analysis, you will need the following R packages:
    dplyr
    tidyverse
    lubridate
    table1

To install these packages to your computer, from the project folder you can run the following bash code:
``` bash       
make install
```   

To execute the analysis, from the project folder you can run the following bash code:

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
