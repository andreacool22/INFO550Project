## My Project Summary
For my project, I will be analyzing deidentified data on antibiotic starts from three nursing home facilities.
To analyze the data you will need R and you will need to install some R packages. The required packages can be installed using the following R commands: 

```r
install.packages("dplyr") 
install.packages("tidyverse")
install.packages("lubridate")
install.packages("table1")
```

## Execute the analysis
To execute the analysis, from the project folder you can run the following bash code:

``` bash       
Rscript -e "rmarkdown::render('Cool_Project_Report.Rmd')"
```   

This will create a file called Cool_Project_Report.html output in your directory that contains the results of the analysis.
