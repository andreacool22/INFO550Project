# load packages 
library(dplyr)
library(tidyverse)
library(lubridate)
library(table1)

# read in data
Cool_Project_Data <- read.csv("Cool_Project_Data.csv", header=TRUE)
png("fig1.png")

#Create a new dataset that filters just for new starts and UTI starts and groups by quarter
Treat_Site_Year <- Cool_Project_Data %>%
    filter(new_start == "New Start") %>% 
    group_by(q.year, treat_site_binary) %>% 
    tally()
    
f1 <- ggplot(Treat_Site_Year, aes(x = q.year, y = n, fill = treat_site_binary)) + 
    theme_bw() +
    scale_fill_grey(name = "") +
    theme(legend.position = "right") +
    geom_bar(stat = "identity", position = position_dodge()) +
    coord_cartesian(ylim = c(0, max(Treat_Site_Year$n))) +
    labs(x = "Quarter", y = "Number of New Starts", title = "New Antibiotic Starts Each Quarter, by Treatment Site")
f1
